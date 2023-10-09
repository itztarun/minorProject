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
    apiKey: 'AIzaSyBSgnLPEe3o2WbbU8cj4ONvFzp9rT36JN4',
    appId: '1:564149557102:web:9bda4d5b786593e62b937f',
    messagingSenderId: '564149557102',
    projectId: 'sdjminorproject',
    authDomain: 'sdjminorproject.firebaseapp.com',
    storageBucket: 'sdjminorproject.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9bu88QqS8kjxEvY5HybmcOZSyf4EKAak',
    appId: '1:564149557102:android:d9616c73a1de04a22b937f',
    messagingSenderId: '564149557102',
    projectId: 'sdjminorproject',
    storageBucket: 'sdjminorproject.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmjhFLErW9DBL1rR4Dz2P817a6dC8jnPk',
    appId: '1:564149557102:ios:2fede8117ec5172b2b937f',
    messagingSenderId: '564149557102',
    projectId: 'sdjminorproject',
    storageBucket: 'sdjminorproject.appspot.com',
    androidClientId: '564149557102-qsqafvsjiusvue7qc17h4cpgh313hds7.apps.googleusercontent.com',
    iosClientId: '564149557102-qpe80ngajkndrhi768nltg5oa1f8uj2b.apps.googleusercontent.com',
    iosBundleId: 'com.example.minorproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmjhFLErW9DBL1rR4Dz2P817a6dC8jnPk',
    appId: '1:564149557102:ios:2fede8117ec5172b2b937f',
    messagingSenderId: '564149557102',
    projectId: 'sdjminorproject',
    storageBucket: 'sdjminorproject.appspot.com',
    androidClientId: '564149557102-qsqafvsjiusvue7qc17h4cpgh313hds7.apps.googleusercontent.com',
    iosClientId: '564149557102-qpe80ngajkndrhi768nltg5oa1f8uj2b.apps.googleusercontent.com',
    iosBundleId: 'com.example.minorproject',
  );
}