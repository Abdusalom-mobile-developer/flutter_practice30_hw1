import 'package:flutter_practice30_hw1/models/user_classes.dart';
import 'package:flutter_practice30_hw1/models/utils.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageClass {
  static var box = GetStorage();

  static void storeUser(String username, String password) {
    SignInInfo info = SignInInfo(username: username, password: password);
    final json = Utils.toJsonSignInInfo(info);
    box.write("signInInfo", json.toString());
  }

  static void storeUser2(
      String username, String email, String phoneNumber, String password) {
    final info = SignUpInfo(
        username: username,
        email: email,
        password: password,
        phoneNumber: phoneNumber);
    final json = Utils.toJsonSignUpInfo(info);
    box.write("signUpInfo", json.toString());
  }

  static String getUser(String key) {
    final String? value = box.read(key);
    return value ?? "404";
  }

  static storeData(String key, String value) {
    box.write(key, value);
  }

  static getData(String key) {
    return box.read(key) ?? "false";
  }
}
