import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'student_list_screen.dart';
import 'route_transition.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 360,
          height: 640,
          color: Colors.white,
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('registration...', style: TextStyle(color: Colors.grey)),
                  IconButton(
                    icon: const Icon(Icons.swap_horiz, color: Colors.black54),
                    onPressed: () => Navigator.of(context).push(createSmoothRoute(const DashboardPage())),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Text('student registration', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              const Text('Student name', style: TextStyle(fontSize: 12, color: Colors.black54)),
              const SizedBox(height: 4),
              Container(height: 35, color: const Color(0xFF1E88E5)),
              const SizedBox(height: 20),
              const Text('Admission number', style: TextStyle(fontSize: 12, color: Colors.black54)),
              const SizedBox(height: 4),
              Container(height: 35, color: const Color(0xFF1E88E5)),
              const SizedBox(height: 20),
              const Text('course', style: TextStyle(fontSize: 12, color: Colors.black54)),
              const SizedBox(height: 4),
              Container(height: 35, color: const Color(0xFF1E88E5)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('save', style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(createSmoothRoute(const StudentListPage())),
                        child: Container(width: 45, height: 30, color: Colors.green),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('cancel', style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(width: 45, height: 30, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}