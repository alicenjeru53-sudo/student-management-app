import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_model.dart';
import 'doctor_model.dart';
import 'appointment_model.dart';

class FirebaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> saveUser(UserModel user) async {
    try {
      await db.collection("users").doc(user.id).set(user.toMap());
    } on FirebaseException catch (e) {
      throw e.message ?? "Failed to save user data";
    } catch (e) {
      throw e.toString();
    }
  }

  Stream<QuerySnapshot> getUsers() {
    return db.collection("users").snapshots();
  }

  Stream<List<DoctorModel>> getDoctors() {
    return db.collection("doctors").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return DoctorModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  Stream<List<AppointmentModel>> getAppointments() {
    return db.collection("appointments").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AppointmentModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> updateAppointment(String id, String status) async {
    await db.collection("appointments").doc(id).update({"status": status});
  }

  Future<void> saveAppointment(Map<String, dynamic> data) async {
    await db.collection("appointments").add(data);
  }
}
