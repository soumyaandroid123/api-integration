// @dart=2.9

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:multiple_user/domain/model/user-model.dart';
import 'package:multiple_user/infrastructure/constant.dart';
import 'package:sentry_flutter/sentry_flutter.dart' as sentry;

class UserServices {
  http.Response response;
  int statusCode;
  UserModel userModel;

  // Get the list of users
  Future<UserModel> listOfUser() async {
    try {
      response = await http
          .get(Uri.parse("${Constant.BASE_URL}api/users?page=2"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      print("Signup Response${response.body}");
      print("${response.statusCode}");
      if (response.statusCode == 200) {
        userModel = UserModel.fromJson(jsonDecode(response.body));
        return userModel;
      } else {
        return null;
      }
    } catch (exception, stackTrace) {
      await sentry.Sentry.captureException(exception, stackTrace: stackTrace);
      return null;
    }
  }
}
