// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA10cKaHnvywBJBWdILWXFv7xWI3oywbjg',
    appId: '1:965812952660:web:972d5739ddd1606e6f57c1',
    messagingSenderId: '965812952660',
    projectId: 'mandacakes-8d75d',
    authDomain: 'mandacakes-8d75d.firebaseapp.com',
    storageBucket: 'mandacakes-8d75d.appspot.com',
    measurementId: 'G-2FSQST0VSW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqTcLml5wOxL5V7diC-G4SLaTvTBviXi0',
    appId: '1:965812952660:android:ac9e858495dadcef6f57c1',
    messagingSenderId: '965812952660',
    projectId: 'mandacakes-8d75d',
    storageBucket: 'mandacakes-8d75d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvRBPTHXQKQXVKFQle24tmvCHIlSk3IBY',
    appId: '1:965812952660:ios:a9153c6e968267a66f57c1',
    messagingSenderId: '965812952660',
    projectId: 'mandacakes-8d75d',
    storageBucket: 'mandacakes-8d75d.appspot.com',
    iosClientId: '965812952660-r2q5p9709uh5g18tnb8tsgtcot61tpcp.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAula1',
  );
}