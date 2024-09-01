import 'package:flutter_practice30_hw1/models/user_classes.dart';
import 'package:logger/logger.dart';

class Utils {
  static Logger logger = Logger();

  static d(String message) {
    logger.d(message);
  }

  static toJsonSignInInfo(SignInInfo info) {
    return {"username": info.username, "password": info.password};
  }

  static toJsonSignUpInfo(SignUpInfo info) {
    return {
      "username": info.username,
      "email": info.email,
      "phoneNumber": info.phoneNumber,
      "password": info.password
    };
  }
}
