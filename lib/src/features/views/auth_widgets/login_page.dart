import 'package:flutter/material.dart';
import 'package:fogaan_rooms/src/constants/colors.dart';
import 'package:fogaan_rooms/src/constants/custom_text_field.dart';
import 'package:fogaan_rooms/src/features/controllers/auth_controller.dart';
import 'package:fogaan_rooms/src/features/views/auth_widgets/sign_up.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailTxtController = TextEditingController();
  final passwordTxtController = TextEditingController();

  @override
  void dispose() {
    emailTxtController.dispose();
    passwordTxtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final AuthController authController = Get.find<AuthController>();

    bool isFormValid() {
      return _formKey.currentState?.validate() ?? false;
    }

    final media = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: isDark ? tDarkBlue : tWhiteSnow,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            // color: Colors.red,
            height: media.height * 1,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome back",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CustomTextField(
                    hintText: "Email",
                    obscureText: false,
                    prefixIcon: Icons.mail,
                    controller: emailTxtController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Provide email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    obscureText: true,
                    prefixIcon: Icons.security,
                    suffixIcon: Icons.visibility_off_rounded,
                    controller: passwordTxtController,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return "Please fill the password field";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(""),
                      Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "Forget Password",
                            style: TextStyle(
                                color: isDark ? fBelge : fDarkBlue,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    width: media.width * 0.95,
                    height: 55,
                    child: TextButton(
                      onPressed: () {
                        authController.signIn(email: emailTxtController.text.trim(), password: passwordTxtController.text.trim());
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: isDark ? fBelge : fDarkBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Obx(() => authController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: isDark ? fDarkBlue : fBelge,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(() => const SignUpScreen());
                    },
                    child: Text.rich(
                      TextSpan(
                          text: "Don't have you an account!",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 12.0,
                                  color: isDark ? fBelge : fDarkBlue),
                          children: [
                            const WidgetSpan(
                              child: SizedBox(
                                width: 10,
                              ),
                            ),
                            TextSpan(
                              text: "Signup",
                              style: TextStyle(
                                  color: isDark ? fBelge : fDarkBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
