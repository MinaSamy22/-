import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String? _selectedCountry;
  String? _selectedGender;

  bool _isLoading = false;

  List<String> countries = ['Egypt', 'USA', 'Canada', 'Germany', 'India'];
  List<String> genders = ['Male', 'Female', 'Other'];

  final Color customColor = Color(0xFF763A12); // #763A12 color

  // Firebase instances
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height, // Ensure the container covers the full screen height
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wara2 1.jpg'), // Ensure the image path is correct
            fit: BoxFit.cover, // Ensure the image covers the entire screen
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                // Title
                Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: customColor,
                  ),
                ),
                const SizedBox(height: 10),

                // Sign-Up Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Name Field (Moved before Email)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person, color: customColor),
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Email Field
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail, color: customColor),
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zAZ0-9.-]+\.[a-zA-Z]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Password Field
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock, color: customColor),
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Confirm Password Field
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline, color: customColor),
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Country Dropdown
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DropdownButtonFormField<String>(
                          value: _selectedCountry,
                          hint: Text('Select Country'),
                          onChanged: (value) {
                            setState(() {
                              _selectedCountry = value;
                            });
                          },
                          items: countries
                              .map((country) => DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          ))
                              .toList(),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.public, color: customColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select your country';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Age Field
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.calendar_today, color: customColor),
                            labelText: 'Age',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your age';
                            }
                            if (int.tryParse(value) == null || int.parse(value) <= 0) {
                              return 'Please enter a valid age';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Custom Gender Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: genders.map((gender) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedGender = gender;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: _selectedGender == gender ? customColor : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: customColor,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  gender,
                                  style: TextStyle(
                                    color: _selectedGender == gender
                                        ? Colors.white
                                        : customColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Sign Up Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              setState(() {
                                _isLoading = true;
                              });

                              try {
                                // Create a new user using Firebase Authentication
                                UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                );



                                // Navigate to the home screen or another page
                                Navigator.pop(context); // Example: Go back to login page
                              } catch (e) {
                                // Handle errors
                                setState(() {
                                  _isLoading = false;
                                });
                                // Show error message (e.g., email already in use)
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: customColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: _isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Already Have Account? Navigate to Login
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Return to Login
                        },
                        child: Text(
                          "Already have an account? Sign In",
                          style: TextStyle(color: customColor),
                        ),
                      ),
                    ],
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
