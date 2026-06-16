import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth get auth => FirebaseAuth.instance;

  Future<UserCredential> register(String email, String password) async {
    try {
      return await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Registration failed";
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserCredential> login(String email, String password) async {
    try {
      return await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Login failed";
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
