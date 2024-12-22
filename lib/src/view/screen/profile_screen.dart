import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

const Color primaryColor = Color.fromARGB(255, 255, 87, 34); // Orange color

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Function to fetch user's first name (fname) from Firestore
  Future<String> fetchFirstName() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId != null) {
      final docSnapshot = await FirebaseFirestore.instance.collection('account').doc(userId).get();

      if (docSnapshot.exists) {
        return docSnapshot['fname'] ?? 'User'; // Default to 'User' if fname is null
      } else {
        return 'User'; // In case no document is found
      }
    } else {
      return 'User'; // In case the user is not logged in
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor, // Set the AppBar color to primaryColor
        elevation: 0, // Remove shadow
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white, // Title color
            fontSize: 28, // Font size
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Profile Header with Avatar and RSC Motors label
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Profile Picture placeholder (RSC Motors)
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: primaryColor, // Use primaryColor
                      child: const Text(
                        'DS', // Initials for placeholder
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FutureBuilder<String>(
                      future: fetchFirstName(), // Fetch first name from Firestore
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return const Text("Error fetching user data");
                        } else if (snapshot.hasData) {
                          return Text(
                            "Hello, ${snapshot.data}!",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          );
                        } else {
                          return const Text(
                            "Hello, User!",
                            style: TextStyle(fontSize: 24, color: Colors.black),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Welcome to your profile page. You can manage your account here.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Contact Section (Email & Phone)
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.email, color: primaryColor), // Use primaryColor
                          const SizedBox(width: 10),
                          Text("Email:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text("rsc@gmail.com", style: TextStyle(fontSize: 18)),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.phone, color: primaryColor), // Use primaryColor
                          const SizedBox(width: 10),
                          Text("Phone:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text("09487367876", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Profile Actions (Contact button)
              ElevatedButton(
                onPressed: () {
                  // Add action for contacting or DMing here
                },
                child: const Text(
                  "Contact Us Now",
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Use primaryColor
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
