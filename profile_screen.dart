import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Patient",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Text("Smart Medical User"),
            const SizedBox(height: 30),
            _isLoading 
              ? const CircularProgressIndicator()
              : ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade100,
                    foregroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  onPressed: () async {
                    setState(() => _isLoading = true);
                    try {
                      debugPrint("Logging out...");
                      await auth.logout();
                      
                      if (!mounted) return;
                      
                      if (context.mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                          (route) => false,
                        );
                      }
                    } catch (e) {
                      if (mounted) {
                        setState(() => _isLoading = false);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Logout failed: $e")),
                          );
                        }
                      }
                    }
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                ),
          ],
        ),
      ),
    );
  }
}
