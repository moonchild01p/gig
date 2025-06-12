import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        // Mode dégradé pour les autres plateformes (tests/debug)
        return android; // ou ios selon votre préférence
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwLHkzB08nO2bjrU9Z6aKJKgw3hSXrXgg',
    appId: '1:104458903265:android:b4ffdc9c0f4ce63cc221a0',
    messagingSenderId: '104458903265',
    projectId: 'gig-app-b2199',
    storageBucket: 'gig-app-b2199.firebasestorage.app',
    databaseURL: 'https://gig-app-b2199-default-rtdb.firebaseio.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC33JN8-Ter625xtzfuJDTf6r9Dulmwtq4',
    appId: '1:104458903265:ios:c2a5f93309e40244c221a0',
    messagingSenderId: '104458903265',
    projectId: 'gig-app-b2199',
    storageBucket: 'gig-app-b2199.firebasestorage.app',
    iosBundleId: 'com.example.myApp',
    databaseURL: 'https://gig-app-b2199-default-rtdb.firebaseio.com',
  );
}