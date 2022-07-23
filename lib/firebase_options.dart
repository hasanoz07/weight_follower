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
    apiKey: 'AIzaSyDwNIcyWGBHiy66jSssDMPDdw_IhKXh8wQ',
    appId: '1:1045185904067:web:0e4a46feafa4c214bd1176',
    messagingSenderId: '1045185904067',
    projectId: 'fir-example-c6af5',
    authDomain: 'fir-example-c6af5.firebaseapp.com',
    storageBucket: 'fir-example-c6af5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArtSi07zkKJGyP-pxh24juDywlS_RxZ7I',
    appId: '1:1045185904067:android:40c4f8f343c56fc0bd1176',
    messagingSenderId: '1045185904067',
    projectId: 'fir-example-c6af5',
    storageBucket: 'fir-example-c6af5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQJm75MbgpSivel__geG2IHGKnfWZkEcc',
    appId: '1:1045185904067:ios:4a014a935d069c80bd1176',
    messagingSenderId: '1045185904067',
    projectId: 'fir-example-c6af5',
    storageBucket: 'fir-example-c6af5.appspot.com',
    androidClientId: '1045185904067-h2fe9g5esgme9onl8kgj5ke5i55m241o.apps.googleusercontent.com',
    iosClientId: '1045185904067-op90sa833a69tlkt70j435ii8n6e37fm.apps.googleusercontent.com',
    iosBundleId: 'com.hasanoz.kiloTakipcisi',
  );
}
