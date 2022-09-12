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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpAf_Tyo8XoNV_IC9tO08AzJ4Hr1Qqx4A',
    appId: '1:493462319594:android:8f20b3e0f67190e3fe0293',
    messagingSenderId: '493462319594',
    projectId: 'todo-firebase-app-bb04f',
    storageBucket: 'todo-firebase-app-bb04f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZwnN0GxYkA2GSlfT-USWhnqSFhdEBWQE',
    appId: '1:493462319594:ios:f0781be4e7c5b364fe0293',
    messagingSenderId: '493462319594',
    projectId: 'todo-firebase-app-bb04f',
    storageBucket: 'todo-firebase-app-bb04f.appspot.com',
    iosClientId: '493462319594-23lidu3ncsgfmarsdrn3o7fgmr1nk2d9.apps.googleusercontent.com',
    iosBundleId: 'com.Rajaram.dayPlanner',
  );
}
