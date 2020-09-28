import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup() async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  String displayName = auth.currentUser.displayName.toString();
  users.add({
    'displayName': displayName,
    'uid': uid,
  });
  return;
}
