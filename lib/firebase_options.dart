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
    apiKey: 'AIzaSyCAFk_zcXbvaINKLN5d6_caNNyC2qtTnpQ',
    appId: '1:81786840540:web:f30b193cec33375889db19',
    messagingSenderId: '81786840540',
    projectId: 'cread-4fddf',
    authDomain: 'cread-4fddf.firebaseapp.com',
    storageBucket: 'cread-4fddf.appspot.com',
    measurementId: 'G-9G3SDJW6S5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBka5_CnuS8H9tI4awFbtip23viSplM49c',
    appId: '1:81786840540:android:506b0ea2f215c5a989db19',
    messagingSenderId: '81786840540',
    projectId: 'cread-4fddf',
    storageBucket: 'cread-4fddf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCa8-EAwW9SpLPd1egcyGcDY2RR-hLCM-I',
    appId: '1:81786840540:ios:bf594f424530d28989db19',
    messagingSenderId: '81786840540',
    projectId: 'cread-4fddf',
    storageBucket: 'cread-4fddf.appspot.com',
    iosClientId: '81786840540-klqgrpu3hedoomi4p30ho3qe2o4amb5p.apps.googleusercontent.com',
    iosBundleId: 'com.example.cread',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCa8-EAwW9SpLPd1egcyGcDY2RR-hLCM-I',
    appId: '1:81786840540:ios:bf594f424530d28989db19',
    messagingSenderId: '81786840540',
    projectId: 'cread-4fddf',
    storageBucket: 'cread-4fddf.appspot.com',
    iosClientId: '81786840540-klqgrpu3hedoomi4p30ho3qe2o4amb5p.apps.googleusercontent.com',
    iosBundleId: 'com.example.cread',
  );
}
