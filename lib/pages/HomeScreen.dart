import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sweetsheet/sweetsheet.dart';
import '../auth.dart';
import '../home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = Auth().currentUser;
  final SweetSheet _sweetSheet = SweetSheet();

  Future<void> signOut() async {
    await Auth().signOut();
    _sweetSheet.show(
      context: context,
      title: Text("Attention"),
      description: Text('Are you sure you want to sign out?'),
      color: CustomSheetColor(
        main: Color.fromARGB(255, 119, 36, 37),
        accent: Color(0xff7b1113),
        icon: Colors.white,
      ),
      icon: Icons.logout,
      positive: SweetSheetAction(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(builder: (context) => new Home()));
        },
        title: 'Yes',
        icon: Icons.open_in_new,
      ),
      negative: SweetSheetAction(
        onPressed: () {
          Navigator.of(context).pop();
        },
        title: 'CANCEL',
      ),
    );
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
              "****-*****-SR-0",
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
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff7b1113)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xff7b1113)),
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
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Announcements",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 23),
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 300,
                  height: 250,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            width: 290,
                            height: 240,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Card(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage("images/noclass.jpg"),
                              ),
                            ),
                            width: 290,
                            height: 130,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text(
                          "5 Hours Ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 20,
                        child: Text(
                          "No Classes Tommorrow\nDue to Typhoon uten",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 250,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            width: 290,
                            height: 240,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Card(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage("images/noclass.jpg"),
                              ),
                            ),
                            width: 290,
                            height: 130,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text(
                          "5 Hours Ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 20,
                        child: Text(
                          "No Classes Tommorrow\nDue to Typhoon uten",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 250,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            width: 290,
                            height: 240,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Card(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage("images/noclass.jpg"),
                              ),
                            ),
                            width: 290,
                            height: 130,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text(
                          "5 Hours Ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 20,
                        child: Text(
                          "No Classes Tommorrow\nDue to Typhoon uten",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
