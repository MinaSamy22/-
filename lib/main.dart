import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SignUpScreen.dart';
import 'HomeScreen.dart';
import 'login_screen.dart';

import 'package:firebase_core/firebase_core.dart'; // 34an el firebase

void main() async {
  // hna cods al firebase to connect
WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
       await Firebase.initializeApp(
           options: FirebaseOptions(
        apiKey: "AIzaSyDGTmaaOS_4-kyOmgngrCrIdfbKLV9ajpA",
        authDomain: "konchue-1c712.firebaseapp.com",
        projectId: "konchue-1c712",
        storageBucket: "konchue-1c712.firebasestorage.app",
        messagingSenderId: "912679488926",
        appId: "1:912679488926:web:f5a0c0dcca71db0f581a8f",
        measurementId: "G-7VKLG02Q6M"));
  }else{
    await Firebase.initializeApp();
  }


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Add `const` here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konchue',
      debugShowCheckedModeBanner: false, // This removes the debug banner
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
