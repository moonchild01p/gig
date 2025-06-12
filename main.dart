import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/firebase_options.dart';
import 'package:my_app/screens/moto.dart';
import 'package:my_app/screens/reclamation.dart';

import 'package:my_app/screens/splash.dart';
import 'package:my_app/screens/vitrine.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}

