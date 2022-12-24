import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Row(
                children: [
                  Text(
                    "Meetings",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 32),
                  ),
                  Spacer(),
                  Builder(
                      builder: (context) => IconButton(
                            icon: Image.asset("images/avatar.png"),
                            onPressed: () =>
                                Scaffold.of(context).openEndDrawer(),
                            iconSize: 50,
                          ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Welcome, Taylor Alison Swift || BSIT 4-2",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black38),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Meetings(
                      Header: "Principles \nof Management",
                      MeetingTime: "1:00AM to 1:30PM",
                      TeacherImage: "images/SanaTeacher.jpg",
                    ),
                    Meetings(
                      Header: "Information \n Assurance",
                      MeetingTime: "1:00AM to 1:30PM",
                      TeacherImage: "images/NayeonTeacher.jpg",
                    ),
                    Meetings(
                        Header: "System Analysis \nand Data",
                        MeetingTime: "1:00AM to 1:30PM",
                        TeacherImage: "images/MinaTeacher.jpg"),
                    Meetings(
                        Header: "Art Appreciation",
                        MeetingTime: "1:00AM to 1:30PM",
                        TeacherImage: "images/MinaTeacher.jpg"),
                    Meetings(
                        Header: "Web Development",
                        MeetingTime: "1:00AM to 1:30PM",
                        TeacherImage: "images/MinaTeacher.jpg"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class Meetings extends StatelessWidget {
  const Meetings(
      {Key? key,
      required this.Header,
      required this.TeacherImage,
      required this.MeetingTime})
      : super(key: key);

  final String Header;
  final String TeacherImage;
  final String MeetingTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Color(0xFFFECAC4)),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 20, left: 30),
      width: 350,
      height: 150,
      // color: Color(0xFF662C2C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "$Header",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 65, 64, 64),
                    fontSize: 20),
              ),
              Spacer(),
              Builder(
                  builder: (context) => ClipRRect(
                        child: IconButton(
                          icon: Image.asset("$TeacherImage"),
                          onPressed: () {},
                          iconSize: 80,
                        ),
                      )),
            ],
          ),
          Text(
            "$MeetingTime",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black26,
                fontSize: 14),
          )
        ],
      ),
    );
  }
}
