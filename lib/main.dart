import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:rsc_motorshop/core/app_theme.dart';
import 'package:rsc_motorshop/firebase_options.dart';
import 'package:rsc_motorshop/login&register/login.dart';
import 'package:rsc_motorshop/login&register/register.dart';
import 'package:rsc_motorshop/screen.dart';
import 'package:rsc_motorshop/src/view/screen/drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized

  // Firebase Initialization
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("Error initializing Firebase: $e");
  }

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),  // Ensure Login screen is working fine
      builder: EasyLoading.init(),  // EasyLoading integration
      theme: AppTheme.lightAppTheme,  // Ensure theme is correctly defined
    );
  }
}
