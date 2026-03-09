import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBmrXKg1TGPTqIsJnfVqJSYVBIncaEhQSc",
            authDomain: "smart-fuel-zxvlat.firebaseapp.com",
            projectId: "smart-fuel-zxvlat",
            storageBucket: "smart-fuel-zxvlat.firebasestorage.app",
            messagingSenderId: "969437710080",
            appId: "1:969437710080:web:2251dd61fe728ee6f195e5"));
  } else {
    await Firebase.initializeApp();
  }
}
