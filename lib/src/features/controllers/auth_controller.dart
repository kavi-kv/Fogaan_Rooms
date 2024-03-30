import 'package:fogaan_rooms/src/features/views/auth_widgets/login_page.dart';
import 'package:fogaan_rooms/src/services/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  Future<void> signUp({required String email, required String password}) async {
    isLoading.value = true;
    await _authServices.createUserWithEmailAndPassword(
        email: email, password: password);
    isLoading.value = false;
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;
    await _authServices.signInWithEmailAndPassword(
        email: email, password: password);
    isLoading.value = false;
  }

  Future<void> logOut() async {
    isLoading.value = true;
    await _authServices.signOut();
    isLoading.value = false;
  }
}
