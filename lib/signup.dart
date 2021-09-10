import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:property_dealers/widgets.dart';
import 'home_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passVisible = true;
  bool confirmPassVisible = true;
  late String fPassword;
  late String email;
  final auth = FirebaseAuth.instance;
  bool isLoggedIn = false;
  late GoogleSignInAccount userObj;

  void signup() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: fPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('https://i.ibb.co/xmmYtHQ/bg1.jpg'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.05,
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Hero(
                    tag: 'BG Image',
                    child: Image.asset(
                      'assets/bg.png',
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    width: size.width * .9,
                    child: Column(
                      children: [
                        RoundedInputField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          label: 'Email ID',
                          keyboardtype: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter an Email';
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return 'Please Enter a Valid Email';
                            }
                          },
                          iconChoose: Icons.account_circle,
                          hint: 'Your ID',
                          suffixiIcon: Icons.account_circle,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextFormField(
                          validator: (val) => val!.length < 6
                              ? 'Password too short.'
                              : null,
                          obscureText: passVisible,
                          cursorColor: Colors.blue[800],
                          decoration: InputDecoration(
                            fillColor: Colors.blue[50],
                            contentPadding:
                            const EdgeInsets.symmetric(vertical: 15.0),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(width: 0.8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0.9, color: Colors.blue),
                            ),
                            hintText: 'Enter Password',
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                passVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              color: Colors.blue,
                              onPressed: () {
                                setState(() {
                                  passVisible = !passVisible;
                                });
                              },
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.blue,
                              // size: 30.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              fPassword = value.trim();
                            });
                          },
                          validator: (val) => val!.length < 6
                              ? 'Password too short.'
                              : null,
                          obscureText: passVisible,
                          cursorColor: Colors.blue[800],
                          decoration: InputDecoration(
                            fillColor: Colors.blue[50],
                            contentPadding:
                            const EdgeInsets.symmetric(vertical: 15.0),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(width: 0.8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0.9, color: Colors.blue),
                            ),
                            hintText: 'Re-Type Password',
                            labelText: 'Confirm Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                passVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              color: Colors.blue,
                              onPressed: () {
                                setState(() {
                                  passVisible = !passVisible;
                                });
                              },
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.blue,
                              // size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Hero(
                    tag: 'Sign Up Button',
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: RoundedButton(() {
                        auth
                            .createUserWithEmailAndPassword(
                                email: email, password: fPassword)
                            .then(
                          (value) {
                            setState(
                              () {
                                isLoggedIn = true;
                                userObj = value as GoogleSignInAccount;
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
                      }, 'Sign Up', Colors.white,
                          Theme.of(context).primaryColor),
                    ),
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
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                              children: const [
                                Icon(
                                  FontAwesomeIcons.google,
                                  size: 35,
                                ),
                                Text(
                                  'Login With Google',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                                Opacity(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
