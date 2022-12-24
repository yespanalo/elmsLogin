import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GradesScreen extends StatefulWidget {
  const GradesScreen({Key? key}) : super(key: key);

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
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
                    "Grades",
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
                "Here are your grades, Taylor Alison Swift",
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
                      DColor: Color.fromARGB(255, 168, 61, 61),
                      Header: "Principles \nof Management",
                      MeetingTime: "Congratulations you passed!",
                      TeacherImage: "images/SanaTeacher.jpg",
                      Grade: "3.0",
                    ),
                    Meetings(
                        DColor: Color.fromARGB(255, 87, 62, 119),
                        Header: "Information \n Assurance",
                        MeetingTime: "I'm Sorry you Failed",
                        TeacherImage: "images/NayeonTeacher.jpg",
                        Grade: "5.0"),
                    Meetings(
                        DColor: Color.fromARGB(255, 49, 178, 211),
                        Header: "System Analysis \nand Data",
                        MeetingTime: "Congratulations you passed!",
                        TeacherImage: "images/MinaTeacher.jpg",
                        Grade: "3.0"),
                    Meetings(
                        DColor: Color.fromARGB(255, 87, 240, 138),
                        Header: "Art Appreciation",
                        MeetingTime: "I'm Sorry you Failed",
                        TeacherImage: "images/MinaTeacher.jpg",
                        Grade: "5.0"),
                    Meetings(
                        DColor: Color.fromARGB(255, 240, 183, 77),
                        Header: "Web Development",
                        MeetingTime: "Congratulations you passed!",
                        TeacherImage: "images/MinaTeacher.jpg",
                        Grade: "3.0"),
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
      required this.MeetingTime,
      required this.DColor,
      required this.Grade})
      : super(key: key);

  final String Header;
  final String TeacherImage;
  final String MeetingTime;
  final String Grade;
  final Color DColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)), color: DColor),
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
                    color: Colors.black,
                    fontSize: 20),
              ),
              Spacer(),
              Text(
                "$Grade",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black26,
                    fontSize: 30),
              )
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
