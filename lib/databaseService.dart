import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user.dart';

class DatabaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future createUserDoc(
      String uid, String name, String email , String role) async {
    final docUser = _userCollection.doc(uid);
    final CustomUser customUser = CustomUser(uid, name, email, role);

    final jsonUser = customUser.toJson();
    return await docUser.set(jsonUser);
  }

  Future registerUser(
      String name, String email, String password, String selectedRole) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      await createUserDoc(user!.uid, name, email, selectedRole);
      return CustomUser(user.uid, name, email , selectedRole);
    } catch (message) {
      print("Register Error message: ${message.toString()}");
      return message;
    }
  }


  CustomUser userObjectFromSnapshot(DocumentSnapshot snapshot) {
    return CustomUser(snapshot.id, snapshot.get('name'),  snapshot.get('email'), snapshot.get('role')
        );
  }

  Stream<CustomUser> getUserByUserID(String uid) {
    return _userCollection.doc(uid).snapshots().map(userObjectFromSnapshot);
  }

  Future loginUser(String email, String password) async{
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (message) {
      print(message.toString());
      return message.toString();
    }
  }

  Future logoutUser() async{
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
}

}
