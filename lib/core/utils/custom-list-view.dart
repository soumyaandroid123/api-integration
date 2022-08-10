import 'package:flutter/material.dart';
import 'package:multiple_user/infrastructure/constant.dart';

class CustomUserListCard extends StatefulWidget {
  final String email;
  final String id;
  final String firstName;
  final String lastName;
  final String img;

  CustomUserListCard(
      {Key? key,
      required this.email,
      required this.id,
      required this.img,
      required this.firstName,
      required this.lastName})
      : super(key: key);

  @override
  _CustomUserListCardState createState() => _CustomUserListCardState();
}

class _CustomUserListCardState extends State<CustomUserListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 23.0, 10.0, 0.0),
        child: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Color(0xff202427),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(1.0, 1.0),
                    blurRadius: 0.5,
                    spreadRadius: 0.5),
                BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    offset: Offset(-1.0, -1.0),
                    blurRadius: 0.4,
                    spreadRadius: 0.4),
              ]),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.id,
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Constant.textColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Divider(
                        color: Constant.textColor,
                        thickness: 1.8,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 15.0),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.img,
                    ),
                    radius: 30,
                  ),
                  title: Text(
                    widget.email,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Constant.textColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        widget.firstName,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Constant.textColorTwo,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        widget.lastName,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Constant.textColorTwo,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
