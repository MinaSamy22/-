import 'package:flutter/material.dart';
import 'SignupScreen.dart'; // Import the SignupScreen
import 'HomeScreen.dart'; // Import the HomeScreen
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  String errorMessage = ''; // To display errors

  // Check if the user is already logged in when the app starts
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Check if a user is already logged in and redirect if so
  void _checkLoginStatus() async {
    User? user = auth.currentUser;
    if (user != null) {
      // If a user is logged in, navigate to the HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color customColor = Color(0xFF763A12); // #763A12 color

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height, // Full screen height
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wara2 1.jpg'), // Background image
            fit: BoxFit.cover, // Ensure image covers the entire screen
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                SizedBox(
                  height: 350,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(height: 0),

                // Title
                Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: customColor,
                  ),
                ),
                const SizedBox(height: 20),

                // Email Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        email = value; // Update the email variable
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail, color: customColor),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        password = value; // Update the password variable
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: customColor),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Login Button
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        errorMessage = ''; // Clear previous error messages
                      });

                      try {
                        // Attempt to sign in
                        await auth.signInWithEmailAndPassword(
                          email: email.trim(),
                          password: password.trim(),
                        );

                        // Navigate to the Home Screen on successful login
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      } on FirebaseAuthException catch (e) {
                        // Handle specific FirebaseAuth exceptions
                        setState(() {
                          if (e.code == 'user-not-found') {
                            errorMessage = 'No user found for this email.';
                          } else if (e.code == 'wrong-password') {
                            errorMessage = 'Incorrect password.';
                          } else {
                            errorMessage = 'Error: ${e.message}';
                          }
                        });
                      } catch (e) {
                        // Handle other exceptions
                        setState(() {
                          errorMessage = 'An unexpected error occurred.';
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: customColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Signup Navigation
                TextButton(
                  onPressed: () {
                    // Navigate to the Signup Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(color: Color(0xFF763A12)), // Apply custom color here
                  ),
                ),
                const SizedBox(height: 20),

                // Error Message Displayed at the End of the Screen
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      errorMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
