import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:property_dealers/signup.dart';
import 'package:property_dealers/widgets.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passVisible = true;
  late String email;
  late String pass;
  final auth = FirebaseAuth.instance;
  bool isLoggedIn = false;
  late GoogleSignInAccount userObj;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, size.height * .05, 20, 0),
                child: const Text(
                  'Client Data Management for Real Estate',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue),
                ),
              ),
              SizedBox(height: size.height * .01),
              Hero(
                tag: 'BG Image',
                child: Image.asset(
                  'assets/bg.png',
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                ),
              ),
              const Text(
                'Existing User ',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              SizedBox(
                width: size.width * .9,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      email = value.trim();
                    });
                  },
                  cursorColor: Colors.blue[800],
                  decoration: InputDecoration(
                    fillColor: Colors.blue[50],
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0.8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        width: 0.8,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    hintText: 'ID',
                    labelText: 'Email ID',
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Theme.of(context).primaryColor,
                      // size: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              SizedBox(
                width: size.width * .9,
                child: TextFormField(
                  validator: (val) =>
                      val!.length < 6 ? 'Password too short.' : null,
                  onChanged: (value) {
                    setState(() {
                      pass = value;
                    });
                  },
                  obscureText: passVisible,
                  cursorColor: Colors.blue[800],
                  decoration: InputDecoration(
                    fillColor: Colors.blue[50],
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0.8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        width: 0.8,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        passVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        setState(() {
                          passVisible = !passVisible;
                        });
                      },
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                      // size: 30.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: RoundedButton(
                    () async => await auth
                        .signInWithEmailAndPassword(
                            email: email, password: pass)
                        .then(
                          (value) => Navigator.push(
                            context,
                            CustomPageRoute(
                              child: MyHomePage(
                                id: userObj.id,
                              ),
                            ),
                          ),
                        ),
                    'Login',
                    Colors.white,
                    Theme.of(context).primaryColor),
              ),
              Column(
                children: [
                  OrDivider(),
                  GestureDetector(
                    onTap: () async {
                      await GoogleSignIn().signIn().then(
                        (value) {
                          setState(
                            () {
                              isLoggedIn = true;
                              userObj = value!;
                            },
                          );
                          Navigator.push(
                            context,
                            CustomPageRoute(
                              child: MyHomePage(
                                id: userObj.email,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.blue),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 1.0), //(x,y),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                              'https://i.ibb.co/NK8qZhq/google.png',
                              height: 32,
                            ),
                            const Text(
                              'Login with Google',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            const Opacity(
                              opacity: 0,
                              child: Icon(
                                FontAwesomeIcons.google,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * .05,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  CustomPageRoute(
                    child: const SignUpScreen(),
                  ),
                ),
                child: const Text(
                  'Don\'t have an account ? Sign Up Now',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: size.height * .115,
              ),
              const Text(
                'SBSSdigital Automation Solutions © 2021',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const Text(
                'Version 1.0',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
