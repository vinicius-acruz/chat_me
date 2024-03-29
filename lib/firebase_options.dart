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
    apiKey: 'AIzaSyA7NiFbiJJleTkKNUT8KJCL0vjH9hOzAdQ',
    appId: '1:660302816945:web:06107d43bb092a8e56a490',
    messagingSenderId: '660302816945',
    projectId: 'chat-me-459a5',
    authDomain: 'chat-me-459a5.firebaseapp.com',
    storageBucket: 'chat-me-459a5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCA7j2NhB_20gNPB4Ycd0iR5J0r0CchK6k',
    appId: '1:660302816945:android:d52f859b115a5bad56a490',
    messagingSenderId: '660302816945',
    projectId: 'chat-me-459a5',
    storageBucket: 'chat-me-459a5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6kEYYG_qkaOFmeItKMXfFFUS7vXol9vg',
    appId: '1:660302816945:ios:2db03fa59f6ffc7b56a490',
    messagingSenderId: '660302816945',
    projectId: 'chat-me-459a5',
    storageBucket: 'chat-me-459a5.appspot.com',
    iosBundleId: 'com.example.chatMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6kEYYG_qkaOFmeItKMXfFFUS7vXol9vg',
    appId: '1:660302816945:ios:4e25cb90f341e5a156a490',
    messagingSenderId: '660302816945',
    projectId: 'chat-me-459a5',
    storageBucket: 'chat-me-459a5.appspot.com',
    iosBundleId: 'com.example.chatMe.RunnerTests',
  );
}
