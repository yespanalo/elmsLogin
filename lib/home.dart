import 'package:elms/auth.dart';
import 'package:elms/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final User? user = Auth().currentUser;
  Future<void> signOut() async {
    await Auth().signOut();
  }

  bool isLogin = true;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  String? errorMessage = "";

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
      print("login success");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/pupbg.jpg"),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10,
                  ),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10,
                  ),
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.6),
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 100,
                              child: Image(
                                  image: AssetImage("images/puplogo.png"))),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "PUP - Learning \nManagement \nSystem",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        width: 300,
                        height: 30,
                        child: TextField(
                            controller: _email,
                            decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: FaIcon(FontAwesomeIcons.envelope),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 300,
                        height: 30,
                        child: TextField(
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: FaIcon(FontAwesomeIcons.lock),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20, top: 10),
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.7),
                                  fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 300,
                        child: TextButton(
                          onPressed: () {
                            signInWithEmailAndPassword();
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.yellow),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.yellow),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Don't have account?",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black.withOpacity(.7),
                        ),
                      ),
                      Text(
                        "CONTACT PUP.COM",
                        style: TextStyle(
                          color: Colors.black.withOpacity(.7),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
