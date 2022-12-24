import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({Key? key}) : super(key: key);

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Image.asset("images/PUPlogo2.png"),
                  ),
                  Text(
                    "Classes",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ClassesWidget(
              link: "https://gstatic.com/classroom/themes/img_backtoschool.jpg",
              courseCode: "BUMA 2435",
              subject: "Principles\nof Management",
              section: "BSIT 4-2",
            ),
            SizedBox(
              height: 30,
            ),
            ClassesWidget(
              link: "https://gstatic.com/classroom/themes/img_code.jpg",
              courseCode: "INTE 5468",
              subject: "INFORMATION\nASSURANCE",
              section: "BSIT 4-2",
            ),
            SizedBox(
              height: 30,
            ),
            ClassesWidget(
              link: "https://gstatic.com/classroom/themes/img_reachout.jpg",
              courseCode: "COMP 9877",
              subject: "SYSTEM\nANALYSIS AND DATA",
              section: "BSIT 4-2",
            ),
            SizedBox(
              height: 30,
            ),
            ClassesWidget(
              link: "https://gstatic.com/classroom/themes/img_code.jpg",
              courseCode: "INTE 5468",
              subject: "ART APPRECIATION",
              section: "BSIT 4-2",
            ),
            SizedBox(
              height: 30,
            ),
            ClassesWidget(
              link: "https://gstatic.com/classroom/themes/img_reachout.jpg",
              courseCode: "COMP 9877",
              subject: "WEB DEVELOPMENT",
              section: "BSIT 4-2",
            ),
            SizedBox(
              height: 30,
            ),
            ClassesWidget(
              link: "https://gstatic.com/classroom/themes/img_code.jpg",
              courseCode: "INTE 5468",
              subject: "INFORMATION\nASSURANCE",
              section: "BSIT 4-2",
            ),
            SizedBox(
              height: 30,
            ),
            ClassesWidget(
              link: "https://gstatic.com/classroom/themes/img_reachout.jpg",
              courseCode: "COMP 9877",
              subject: "SYSTEM\nANALYSIS AND DATA",
              section: "BSIT 4-2",
            ),
          ],
        ),
      )),
    );
  }
}

class ClassesWidget extends StatelessWidget {
  const ClassesWidget({
    Key? key,
    required this.link,
    required this.courseCode,
    required this.subject,
    required this.section,
  }) : super(key: key);

  final String link;
  final String subject;
  final String courseCode;
  final String section;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              fit: BoxFit.cover,
              link,
              width: MediaQuery.of(context).size.width / 1.12,
              height: 130,
            ),
          ),
          Positioned(
            top: 15,
            left: 15,
            child: Text(
              subject,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 75,
            left: 15,
            child: Text(
              courseCode,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Positioned(
            top: 95,
            left: 15,
            child: Text(
              section,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
