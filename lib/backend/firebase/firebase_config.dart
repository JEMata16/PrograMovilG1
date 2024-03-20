import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC1w3kTPOp8kIR-x9vgrebtSP6PyWx6ij0",
            authDomain: "proyecto-g1-9canmw.firebaseapp.com",
            projectId: "proyecto-g1-9canmw",
            storageBucket: "proyecto-g1-9canmw.appspot.com",
            messagingSenderId: "666659878203",
            appId: "1:666659878203:web:79fc13a6f085d7f9ff331e"));
  } else {
    await Firebase.initializeApp();
  }
}
