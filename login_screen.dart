import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'registration_screen.dart';
import 'route_transition.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 360,
          height: 640,
          color: const Color(0xFF8B8589).withOpacity(0.5),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'student management app',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 40),
              const Text('username:', style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 4),
              Container(height: 40, color: const Color(0xFF2B93D1)),
              const SizedBox(height: 20),
              const Text('password:', style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 4),
              Container(height: 40, color: const Color(0xFF257FA4)),
              const SizedBox(height: 40),
              const Text('Register new student', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => Navigator.of(context).push(createSmoothRoute(const RegistrationPage())),
                child: Container(height: 45, color: const Color(0xFF0D52A1)),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00ADB5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () => Navigator.of(context).push(createSmoothRoute(const HomePage())),
                  child: const Text('login', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}