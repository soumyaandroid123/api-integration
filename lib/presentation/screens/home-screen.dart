// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multiple_user/application/state/mobx/listUserState.dart';
import 'package:multiple_user/core/utils/custom-list-view.dart';
import 'package:multiple_user/core/utils/loader.dart';
import 'package:multiple_user/infrastructure/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListUserStore _listUserStore;

  @override
  void initState() {
    super.initState();
    _listUserStore = ListUserStore();
    _listUserStore.getMultiUsers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:  Constant.mainColor,
      appBar: AppBar(
        backgroundColor: Constant.mainColor,
        title: appbarTitle(),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              listOfMultipleUsers(),
            ],
          ),
          Observer(builder: (BuildContext context) {
            if (_listUserStore.state == ListUserState.None) {
              return Container();
            } else if (_listUserStore.state == ListUserState.Loading) {
              return Loader();
            } else if (_listUserStore.state == ListUserState.Success) {
              return Container();
            } else if (_listUserStore.state == ListUserState.Failed) {
              return Container();
            } else {
              return Container();
            }
          })
        ],
      ),
    );
  }

  // App bar title
  Widget appbarTitle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Text(
          'MULTIPLE  USERS  LIST',
          textScaleFactor: 1.0,
          style: TextStyle(
            color: Color(0xffE1E1E1),
            fontSize: 16.0,
            fontWeight: FontWeight.w500,)
      ),
    );
  }

  // List of users
  Widget listOfMultipleUsers() {
    return Observer(builder: (BuildContext context) {
      if (_listUserStore.userModel != null) {
        return Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _listUserStore.userModel.data.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomUserListCard(
                  email:
                      _listUserStore.userModel.data[index].email.toString(),
                  firstName: _listUserStore.userModel.data[index].firstName
                      .toString(),
                  lastName: _listUserStore.userModel.data[index].lastName
                      .toString(),
                  id: _listUserStore.userModel.data[index].id.toString(),
                  img: _listUserStore.userModel.data[index].avatar.toString(),
                );
              }),
        );
      } else {
        return Container();
      }
    });
  }
}
