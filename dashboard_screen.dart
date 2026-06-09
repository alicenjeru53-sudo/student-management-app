import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'student_list_screen.dart';
import 'route_transition.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 360,
          height: 640,
          color: const Color(0xFF7FE5E9),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text('dashboard', style: TextStyle(color: Colors.black54, fontSize: 14)),
              const SizedBox(height: 10),
              const Text('Dashboard', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 10),
              const Text('Welcome, Admin!', style: TextStyle(fontSize: 16, color: Colors.black87)),
              const SizedBox(height: 40),
              Row(
                children: [
                  Container(width: 80, height: 35, color: const Color(0xFF1976D2)),
                  const SizedBox(width: 15),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(createSmoothRoute(const RegistrationPage())),
                    child: const Text('Add student', style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(width: 80, height: 35, color: const Color(0xFF1976D2)),
                  const SizedBox(width: 15),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(createSmoothRoute(const StudentListPage())),
                    child: const Text('view student', style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF009688),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(createSmoothRoute(const LoginPage()), (route) => false);
                  },
                  child: const Text('logout', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}