import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class LandingScreens extends StatefulWidget {
  LandingScreens({Key? key}) : super(key: key);

  @override
  State<LandingScreens> createState() => _LandingScreensState();
}

class _LandingScreensState extends State<LandingScreens> {
  static final initialPosition = LatLng(16.021979541378837, 120.46801411927918);
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  Set<Polyline> _polylines = {};
  Set<Marker> filteredMarkers = {}; // For search and nearby features
  LatLng? _userLocation;
  LatLng _currentLocation = LatLng(16.021979541378837, 120.46801411927918);

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _fetchPlacesFromFirestore();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Get user's current location
  void _getCurrentLocation() async {
    if (!await _checkLocationPermission()) {
      return;
    }
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
    });
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: _userLocation!,
      zoom: 15,
      tilt: 50,
      bearing: 30,
    )));
  }

  // Check and request location permission
  Future<bool> _checkLocationPermission() async {
    bool isEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Location Service is disabled")));
      return false;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location permission is denied. Please allow permission to proceed.')),
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location permission is permanently denied. Change it in settings to continue.')),
      );
      return false;
    }
    return true;
  }

  // Fetch places from Firestore
  Future<void> _fetchPlacesFromFirestore() async {
    FirebaseFirestore.instance.collection('favPlace').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        GeoPoint geoPoint = doc['position'];
        String name = doc['Name Place'];
        String details = doc['detail'];
        String type = doc['type'];

        LatLng placeLocation = LatLng(geoPoint.latitude, geoPoint.longitude);

        String markerIcon = type == 'motor' ? 'assets/images/motor.png' : 'assets/images/truck.png';
        BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(20, 20)),
          markerIcon,
        );

        setState(() {
          markers.add(
            Marker(
              markerId: MarkerId(doc.id),
              position: placeLocation,
              infoWindow: InfoWindow(title: name, snippet: details),
              icon: customIcon,
              onTap: () {
                _addPolyline(_userLocation!, placeLocation);
              },
            ),
          );
        });
      });
    });
  }

  // Add polyline from user location to a specific place
  Future<void> _addPolyline(LatLng start, LatLng end) async {
    try {
      final points = await _getRoutePolyline(start, end);
      if (points.isNotEmpty) {
        setState(() {
          _polylines.add(
            Polyline(
              polylineId: PolylineId('route-${start.latitude}-${start.longitude}-${end.latitude}-${end.longitude}'),
              points: points,
              color: Colors.blue,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
            ),
          );
        });
      }
    } catch (e) {
      print('Error fetching route: $e');
    }
  }

  // Fetch route polyline from OpenRouteService API
  Future<List<LatLng>> _getRoutePolyline(LatLng start, LatLng end) async {
    final apiKey = '5b3ce3597851110001cf6248d540b43c788c400eba6f781740be398d';
    final url =
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final coordinates = data['features'][0]['geometry']['coordinates'];
        return coordinates.map<LatLng>((coord) {
          return LatLng(coord[1], coord[0]);
        }).toList();
      } else {
        print('Failed to fetch polyline: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching polyline data: $e');
      return [];
    }
  }

  // Search places by name
  void _searchPlace(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredMarkers = markers;
      } else {
        filteredMarkers = markers.where((marker) {
          return marker.infoWindow.title!.toLowerCase().contains(query.toLowerCase());
        }).toSet();
      }
    });
  }

  // Filter nearby places within a certain radius
  void _filterNearbyPlaces(double radius) {
    if (_userLocation == null) return;

    setState(() {
      filteredMarkers = markers.where((marker) {
        final distance = _calculateDistance(_userLocation!, marker.position);
        return distance <= radius;
      }).toSet();
    });
  }

  // Calculate distance using Haversine formula
double _calculateDistance(LatLng start, LatLng end) {
  const earthRadius = 6371; // Radius of the Earth in kilometers
  final dLat = (end.latitude - start.latitude) * (pi / 180);
  final dLon = (end.longitude - start.longitude) * (pi / 180);

  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(start.latitude * (pi / 180)) *
          cos(end.latitude * (pi / 180)) *
          sin(dLon / 2) *
          sin(dLon / 2);

  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return earthRadius * c;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search places...",
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                _searchPlace('');
              },
            ),
          ),
          onChanged: (value) => _searchPlace(value),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.near_me),
            onPressed: () {
              _filterNearbyPlaces(5.0);
            },
          ),
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: initialPosition,
          zoom: 15,
          tilt: 45,
          bearing: 30,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
        markers: filteredMarkers.isNotEmpty ? filteredMarkers : markers,
        polylines: _polylines,
      ),
    );
  }
}
