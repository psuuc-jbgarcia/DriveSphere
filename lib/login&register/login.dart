import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rsc_motorshop/login&register/register.dart';
import 'package:rsc_motorshop/src/view/screen/drawer.dart';

// Updated Orange color
const Color primaryColor = Color.fromARGB(255, 255, 87, 34); // Orange color

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = TextEditingController();
  var pass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _obscurePassword = true; // To toggle password visibility

  void login() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: "Logging in");
      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: pass.text,
        );
        EasyLoading.dismiss();
        print(userCredential);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      } catch (error) {
        EasyLoading.dismiss();
        print("Firebase Authentication Error: $error");
        if (error is FirebaseAuthException) {
          if (error.code == "invalid-email") {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'The email address is badly formatted.',
            );
          } else if (error.code == "user-not-found" ||
              error.code == "wrong-password") {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Invalid email or password.',
            );
          } else {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'An error occurred: ${error.message}',
            );
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DriveSphere',
          style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),
          
        ),
        backgroundColor: primaryColor, // Orange color for AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Display logo
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/rscsuperlogo copy.png',
                        width: 300,
                        height: 300,
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  // Email input field
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: primaryColor), // Orange color for border
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  // Password input field with Eye Button
                  TextFormField(
                    controller: pass,
                    obscureText: _obscurePassword, // Toggle password visibility
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: primaryColor), // Orange color for border
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: primaryColor, // Eye button color
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword; // Toggle visibility
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  // Login button
                  ElevatedButton(
                    onPressed: login,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor, // Orange button color
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'or',
                    style: TextStyle(
                        fontSize: 18.0, color: Colors.black54),
                  ),
                  SizedBox(height: 20.0),
                  // Redirect to Register page
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Register()));
                    },
                    child: Text(
                      'Don\'t have an account? Register here',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
