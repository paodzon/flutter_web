import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/app.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCUKJ3XvCnZaXRXR9aYJ7qLkvNcZE7XxkQ",
          authDomain: "flutter-crud-61868.firebaseapp.com",
          projectId: "flutter-crud-61868",
          storageBucket: "flutter-crud-61868.appspot.com",
          messagingSenderId: "519533156916",
          appId: "1:519533156916:web:cef3c4629e45fdc5144861"));
  runApp(const App());
}
