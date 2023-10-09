import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:minorproject/main.dart';

import '../../api/api.dart';
import '../../helper/dialogs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isAnimate = true;
    });
  }

  //Function to Handle Signin in our App
  _handleGoogleBtnClick() {
    //For Showing ProgressBar
    Dialogs.showProgress(context);

    _signInWithGoogle().then((user) async {
      //For Hiding ProgressBar
      Navigator.pop(context);
      if (user != null) {
        log('\nUser:${user.user}');
        log('\nUserAdditional:${user.additionalUserInfo}');

        if (await (Apis.userExists())) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          await Apis.createUser().then(
              (value) => {Navigator.pushReplacementNamed(context, '/home')});
        }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await Apis.auth.signInWithCredential(credential);
    } catch (e) {
      log('\n_signInWithGoogle: $e');
      Dialogs.showSnackbar(context, 'Something Went Wrong');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome To CHIT-CHAT"),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: mq.height * .15,
            width: mq.width * .50,
            right: _isAnimate ? mq.width * .25 : -mq.width * .5,
            duration: const Duration(seconds: 2),
            child: Image.asset("images/chat.png"),
          ),
          Positioned(
              bottom: mq.height * .15,
              left: mq.width * .05,
              width: mq.width * .9,
              height: mq.height * .06,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: const StadiumBorder()),
                  onPressed: () {
                    //Function to handle FireBase and to navigate to homeScreen
                    _handleGoogleBtnClick();
                  },
                  icon: Image.asset(
                    "images/google.png",
                    height: mq.height * .04,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 23),
                          children: [
                            TextSpan(
                              text: "Login with ",
                            ),
                            TextSpan(
                                text: "Google",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ]),
                    ),
                  ))),
        ],
      ),
    );
  }
}
