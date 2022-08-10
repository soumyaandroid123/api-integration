// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9
part of 'listUserState.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListUserStore on _ListUserStore, Store {
  final _$stateAtom = Atom(name: '_ListUserStore.state');

  @override
  ListUserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ListUserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$userModelAtom = Atom(name: '_ListUserStore.userModel');

  @override
  UserModel get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$getMultiUsersAsyncAction =
      AsyncAction('_ListUserStore.getMultiUsers');

  @override
  Future getMultiUsers() {
    return _$getMultiUsersAsyncAction.run(() => super.getMultiUsers());
  }

  @override
  String toString() {
    return '''
state: ${state},
userModel: ${userModel}
    ''';
  }
}
