import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:rsc_motorshop/core/app_data.dart';
import 'package:rsc_motorshop/login&register/login.dart';
import 'package:rsc_motorshop/screen.dart';
import 'package:rsc_motorshop/src/view/screen/cart_screen.dart';
import 'package:rsc_motorshop/src/view/screen/chatbot.dart';
import 'package:rsc_motorshop/src/view/widget/page_wrapper.dart';
import 'package:rsc_motorshop/src/view/screen/profile_screen.dart';
import 'package:rsc_motorshop/src/view/screen/favorite_screen.dart';
import 'package:rsc_motorshop/src/view/screen/product_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const List<Widget> screens = [
    ProductListScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const Color primaryColor = Color.fromARGB(255, 255, 87, 34); // Orange color

class _HomeScreenState extends State<HomeScreen> {
  int newIndex = 0;

  // A helper method to handle sign out and navigation
  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Login()),
      );
    } catch (e) {
      // Handle error during sign out (e.g., show an error dialog)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error during sign-out: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Scaffold(
        // Drawer with Dashboard and Sign-Out options
        drawer: Drawer(
          child: Column(
            children: [
              // Drawer Header with orange background and user info
              DrawerHeader(
                decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 30, // Example user avatar
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: primaryColor, size: 40),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'DASHBOARD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 2,
                        width: 50,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              // Adding menu options to the Drawer with icons
              _drawerItem('Find Dealership', Icons.location_on, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LandingScreens()),
                );
              }),
              _drawerItem('Favorites', Icons.favorite, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FavoriteScreen()),
                );
              }),
              _drawerItem('Cart', Icons.shopping_cart, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CartScreen()),
                );
              }),
              _drawerItem('Profile', Icons.person, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProfileScreen()), // Navigate to ChatBotScreen
                );
              }),
              _drawerItem('Log out', Icons.exit_to_app, signOut),
            ],
          ),
        ),
        // Bottom Navigation Bar with custom items
        bottomNavigationBar: BottomNavyBar(
          itemCornerRadius: 10,
          selectedIndex: newIndex,
          items: AppData.bottomNavyBarItems
              .map(
                (item) => BottomNavyBarItem(
                  icon: item.icon,
                  title: Text(item.title),
                  activeColor: item.activeColor,
                  inactiveColor: item.inActiveColor,
                ),
              )
              .toList(),
          onItemSelected: (currentIndex) {
            setState(() {
              newIndex = currentIndex;
            });
          },
        ),
        // Page Transition Switcher for smooth transitions between screens
        body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: HomeScreen.screens[newIndex],
        ),
      ),
    );
  }

  // Helper method for creating a Drawer menu item with icon and action
  Widget _drawerItem(String title, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: TextButton(
        onPressed: onTap,
        child: Row(
          children: [
            Icon(icon, color: primaryColor),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 14),
          textStyle: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
