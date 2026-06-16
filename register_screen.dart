import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'firebase_service.dart';
import 'user_model.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  AuthService auth = AuthService();
  FirebaseService firebase = FirebaseService();

  Future<void> register() async {
    try {
      var result = await auth.register(
        email.text.trim(),
        password.text.trim(),
      );

      UserModel user = UserModel(
        id: result.user!.uid,
        name: name.text.trim(),
        email: email.text.trim(),
        role: "patient",
      );

      await firebase.saveUser(user);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      String errorMessage = e.toString();
      if (errorMessage.contains("email-already-in-use")) {
        errorMessage = "This email is already registered. Please login instead.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                labelText: "Full Name",
              ),
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: register,
              child: const Text("REGISTER"),
            ),
          ],
        ),
      ),
    );
  }
}
