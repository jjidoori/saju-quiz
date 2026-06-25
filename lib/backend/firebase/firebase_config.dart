import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAuG0cUwe-4AjzBhG6VBP_QJFcUmNqlWIo",
            authDomain: "saju-quiz.firebaseapp.com",
            projectId: "saju-quiz",
            storageBucket: "saju-quiz.firebasestorage.app",
            messagingSenderId: "7725651279",
            appId: "1:7725651279:web:bbb3a3fecc808c8704213a",
            measurementId: "G-914SS8JNTW"));
  } else {
    await Firebase.initializeApp();
  }
}
