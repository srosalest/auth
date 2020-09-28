import 'package:flutter/material.dart';
import 'package:tureciclaje_auth/routes.dart';
import 'package:tureciclaje_auth/views/opening_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: AppRoutes.define(),
      home: OpeningView(), //pantalla principal al inicio de la app
    );
  }
}
