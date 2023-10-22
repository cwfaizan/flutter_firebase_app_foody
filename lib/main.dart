import 'package:firebase_core/firebase_core.dart';
import 'package:cwf_fudy/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await setupEmulators();
  runApp(const ProviderScope(child: MyApp()));
}
