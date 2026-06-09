import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'route_transition.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Text('homepage', style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Welcome to the Student\nManagement System',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const SizedBox(height: 20),
              const Text(
                'Manage student records, registrations, and information from one centralized platform.',
                style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.4),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00ADB5),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  onPressed: () => Navigator.of(context).push(createSmoothRoute(const DashboardPage())),
                  child: const Text('go to dashboard', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}