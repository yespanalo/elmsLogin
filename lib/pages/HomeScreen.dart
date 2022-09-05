import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../auth.dart';
import '../home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = Auth().currentUser;
  Future<void> signOut() async {
    await Auth().signOut();
    Navigator.of(context, rootNavigator: true)
        .pushReplacement(MaterialPageRoute(builder: (context) => new Home()));
  }

  late final mailID = user?.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(width: 100, child: Image.asset("images/PUPlogo2.png"))
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: 100,
              child: Image.asset("images/avatar.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "$mailID",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "2019-00514-SR-0",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Spacer(),
            Container(
              width: 250,
              margin: EdgeInsets.only(bottom: 50),
              child: TextButton(
                onPressed: () {
                  signOut();
                },
                child: Text(
                  "Signout ",
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.yellow),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      body: SafeArea(
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
                  "PUP-LMS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Spacer(),
                Builder(
                    builder: (context) => IconButton(
                          icon: Image.asset("images/avatar.png"),
                          onPressed: () => Scaffold.of(context).openEndDrawer(),
                          iconSize: 50,
                        ))

                // Container(
                //   width: 50,
                //   child: Image.asset("images/avatar.png"),
                // ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
