// @dart=2.9

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:multiple_user/domain/model/user-model.dart';
import 'package:multiple_user/infrastructure/services/user-services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'listUserState.g.dart';

enum ListUserState {
  None,
  Loading,
  Success,
  Failed,
}

class ListUserStore = _ListUserStore with _$ListUserStore;

abstract class _ListUserStore with Store {
  UserServices _userServices = UserServices();

  @observable
  ListUserState state = ListUserState.None;

  @observable
  UserModel userModel;

  // Get the list of users
  @action
  getMultiUsers() async {
    state = ListUserState.Loading;
    try {
      userModel = await _userServices.listOfUser();
      if (userModel != null) {
        state = ListUserState.Success;
      } else {
        state = ListUserState.Failed;
      }
    } catch (exception, stackTrace) {
      await Sentry.captureException(exception, stackTrace: stackTrace);
      await Sentry.captureMessage(
          "File: optimizationOfClaimState.dart,fun: getCashlessClaims");
      state = ListUserState.Failed;
      Fluttertoast.showToast(msg: "Some error occured, please try again later");
    }
  }
}
