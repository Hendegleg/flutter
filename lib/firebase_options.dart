// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBhQEwnLrCcZignpY5bbpEVbjI9ZXDk6W8',
    appId: '1:758513532274:web:cb8fbdd9e59ea8858a71eb',
    messagingSenderId: '758513532274',
    projectId: 'fooddelivery-14ae9',
    authDomain: 'fooddelivery-14ae9.firebaseapp.com',
    storageBucket: 'fooddelivery-14ae9.appspot.com',
    measurementId: 'G-4M5VZ98N51',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2EDCFZXMkGVadhsBBH3UqgGy3rctMQLA',
    appId: '1:758513532274:android:f797c889be5341938a71eb',
    messagingSenderId: '758513532274',
    projectId: 'fooddelivery-14ae9',
    storageBucket: 'fooddelivery-14ae9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTHndctgCNNIW8nqODt0FjsgdCC0hovyQ',
    appId: '1:758513532274:ios:4a34dddb157e35708a71eb',
    messagingSenderId: '758513532274',
    projectId: 'fooddelivery-14ae9',
    storageBucket: 'fooddelivery-14ae9.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTHndctgCNNIW8nqODt0FjsgdCC0hovyQ',
    appId: '1:758513532274:ios:4a34dddb157e35708a71eb',
    messagingSenderId: '758513532274',
    projectId: 'fooddelivery-14ae9',
    storageBucket: 'fooddelivery-14ae9.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBhQEwnLrCcZignpY5bbpEVbjI9ZXDk6W8',
    appId: '1:758513532274:web:26ea7b8c26eb8e468a71eb',
    messagingSenderId: '758513532274',
    projectId: 'fooddelivery-14ae9',
    authDomain: 'fooddelivery-14ae9.firebaseapp.com',
    storageBucket: 'fooddelivery-14ae9.appspot.com',
    measurementId: 'G-55L5DT9SY6',
  );
}