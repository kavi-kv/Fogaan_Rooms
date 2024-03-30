import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fogaan_rooms/firebase_options.dart';
import 'package:fogaan_rooms/src/features/controllers/auth_controller.dart';
import 'package:fogaan_rooms/src/features/views/auth_widgets/login_page.dart';
import 'package:fogaan_rooms/src/features/views/auth_widgets/sign_up.dart';
import 'package:fogaan_rooms/src/features/views/home/Home.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.lazyPut<AuthController>(() => AuthController());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SignUpScreen(),
    );
  }
}
