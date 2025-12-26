import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Network info
  sl.registerLazySingleton(() => Connectivity());

  // Firebase instances
  // sl.registerLazySingleton(() => FirebaseAuth.instance);
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  // sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Google Sign-In
  sl.registerLazySingleton(() => GoogleSignIn.instance);

  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
