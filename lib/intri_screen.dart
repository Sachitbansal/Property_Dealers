import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff283a5b),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    'https://www.sbssdigital.com/assets/img/MSC%20Logo%20V2.webp',
                    width: MediaQuery.of(context).size.width * .4,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              const Text(
                  'ENQUIRY MANAGEMENT SOLUTION',
                style: kdefaultsttle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              const Text(
                  'for',
                style: kdefaultsttle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              const Text(
                  'REAL ESTATE BUSINESS',
                style: kdefaultsttle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .16,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width * .85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Existing User',
                      textAlign: TextAlign.left,
                      style: kdefaultsttle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      child: TextFormField(
                        cursorColor: Colors.blue[800],
                        decoration: InputDecoration(
                          fillColor: Colors.blue[50],
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 1.0),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            borderSide: const BorderSide(width: 0.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            borderSide: BorderSide(
                              width: 0.8,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'ID',
                          labelText: 'Email ID',
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Color(0xFF1565C0),
                            // size: 30.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      child: TextFormField(
                        validator: (val) =>
                        val!.length < 6 ? 'Password too short.' : null,
                        obscureText: true,
                        cursorColor: Colors.blue[800],
                        decoration: InputDecoration(
                          fillColor: Colors.blue[50],
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 1.0),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            borderSide: const BorderSide(width: 0.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            borderSide: BorderSide(
                              width: 0.8,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xFF1565C0),
                            // size: 30.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: const [
                        Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign In',
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 1.2,
                              color: Color(0xFF1565C0),
                              fontWeight: FontWeight.w700
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
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

const TextStyle kdefaultsttle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold
);