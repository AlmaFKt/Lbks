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
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB_CbGaToFMwYri9WnV-u_R_j4oi1vxnyo',
    appId: '1:232530466293:web:a134e3aa744d57b8723cbc',
    messagingSenderId: '232530466293',
    projectId: 'website-type',
    authDomain: 'website-type.firebaseapp.com',
    databaseURL: 'https://website-type-default-rtdb.firebaseio.com',
    storageBucket: 'website-type.appspot.com',
    measurementId: 'G-0S47RMX2TS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1lELNB8Mg1xASPHasrVpMQ49K6zbQl-k',
    appId: '1:232530466293:android:74c0ca10c7bee7bd723cbc',
    messagingSenderId: '232530466293',
    projectId: 'website-type',
    databaseURL: 'https://website-type-default-rtdb.firebaseio.com',
    storageBucket: 'website-type.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiH5hZ2iS6-rqAScG4pk_Xr49UDoAEYm0',
    appId: '1:232530466293:ios:eb1dcf888fd7392b723cbc',
    messagingSenderId: '232530466293',
    projectId: 'website-type',
    databaseURL: 'https://website-type-default-rtdb.firebaseio.com',
    storageBucket: 'website-type.appspot.com',
    iosBundleId: 'com.example.flutterApplication2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiH5hZ2iS6-rqAScG4pk_Xr49UDoAEYm0',
    appId: '1:232530466293:ios:f11767e872adbc33723cbc',
    messagingSenderId: '232530466293',
    projectId: 'website-type',
    databaseURL: 'https://website-type-default-rtdb.firebaseio.com',
    storageBucket: 'website-type.appspot.com',
    iosBundleId: 'com.example.flutterApplication2.RunnerTests',
  );
}