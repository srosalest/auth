import 'package:firebase_auth/firebase_auth.dart';

Future<void> checkAuth() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  if (auth.currentUser != null) {
    print("Already Signed in");
  } else {
    print("Signed Out");
  }
}

Future<void> signUp(String emailController, String passwordController,
    String usernameController) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController,
      password: passwordController,
    );
    User updateUser = FirebaseAuth.instance.currentUser;
    await updateUser.updateProfile(displayName: usernameController);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<void> signIn(String emailController, String passwordController) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController,
      password: passwordController,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    } else {
      print(e.code.toString());
    }
  }
}

Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    print("Success");
  } catch (e) {
    print(e.toString());
  }
}
