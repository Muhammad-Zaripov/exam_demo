import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_4_oy_demo/features/profile/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addOrUpdateUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.userId).set(user.toJson());
      print('User saved successfully');
    } catch (e) {
      print('Error saving user: $e');
    }
  }

  Future<UserModel?> getUser(String userId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists && doc.data() != null) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error getting user: $e');
    }
    return null;
  }

  String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }
}