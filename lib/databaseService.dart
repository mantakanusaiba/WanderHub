import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'user.dart';
class DatabaseService1{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addBooking({
    required String from,
    required String to,
    required DateTime dateOfJourney,
    required DateTime dateOfReturn,
    required String busName,
    required List<String> selectedSeats,
    required double totalPrice,
  }) async {
    await _firestore.collection('bookings').add({
      'from': from,
      'to': to,
      'dateOfJourney': dateOfJourney,
      'dateOfReturn': dateOfReturn,
      'busName': busName,
      'selectedSeats': selectedSeats,
      'totalPrice': totalPrice,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}

class DatabaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userCollection =
  FirebaseFirestore.instance.collection('users');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future createUserDoc(String uid, String name, String email, String phone, String role,
      {String? profileImageUrl}) async {
    final docUser = _userCollection.doc(uid);
    final CustomUser customUser =
    CustomUser(uid, name, email, phone, role, profileImageUrl: profileImageUrl);

    final jsonUser = customUser.toJson();
    return await docUser.set(jsonUser);
  }

  Future<String> _uploadProfileImage(File imageFile, String uid) async {
    try {
      final Reference storageReference =
      _storage.ref().child('profile_images').child('$uid.jpg');
      final UploadTask uploadTask = storageReference.putFile(imageFile);
      final TaskSnapshot taskSnapshot = await uploadTask;
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading profile image: $e");
      return "";
    }
  }

  Future registerUserWithPicture(
      String name, String email, String password, String phone, String selectedRole, File? profileImage) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;

      String profileImageUrl = "";
      if (profileImage != null) {
        profileImageUrl = await _uploadProfileImage(profileImage, user!.uid);
      }

      await createUserDoc(user!.uid, name, email, phone, selectedRole,
          profileImageUrl: profileImageUrl);

      return CustomUser(user.uid, name, email, phone, selectedRole,
          profileImageUrl: profileImageUrl);
    } catch (message) {
      print("Register Error message: ${message.toString()}");
      return message;
    }
  }

  CustomUser userObjectFromSnapshot(DocumentSnapshot snapshot) {
    return CustomUser(
      snapshot.id,
      snapshot.get('name'),
      snapshot.get('email'),
      snapshot.get('phone'),
      snapshot.get('role'),
      profileImageUrl: snapshot.get('profileImageUrl'),
    );
  }

  Stream<CustomUser> getUserByUserID(String uid) {
    return _userCollection.doc(uid).snapshots().map(userObjectFromSnapshot);
  }

  Future loginUser(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (message) {
      print(message.toString());
      return message.toString();
    }
  }

  Future logoutUser() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
