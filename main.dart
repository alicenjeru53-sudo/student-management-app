import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'splash_screen.dart';
import 'app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  String? initError;
  try {
    if (kIsWeb) {
      // Manual configuration for Web to bypass CLI issues
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyAJIJkvRdpeC0V40-v5arGYoWJUbGCoHfY",
          appId: "1:1016427974282:android:6270b8b39e827a7a94e773",
          messagingSenderId: "1016427974282",
          projectId: "smart-medical-system-9c838",
          storageBucket: "smart-medical-system-9c838.firebasestorage.app",
          authDomain: "smart-medical-system-9c838.firebaseapp.com",
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e) {
    initError = e.toString();
    debugPrint("Firebase initialization failed: $e");
  }

  runApp(SmartMedicalApp(initError: initError));
}

class SmartMedicalApp extends StatelessWidget {
  final String? initError;
  const SmartMedicalApp({super.key, this.initError});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Medical System",
      theme: AppTheme.theme,
      home: initError != null 
        ? Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Firebase Initialization Error:\n$initError", 
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red)),
              ),
            ),
          )
        : const SplashScreen(),
    );
  }
}
