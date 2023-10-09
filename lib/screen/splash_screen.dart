

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../api/api.dart';
import '../main.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white,statusBarColor: Colors.white));
      if(Apis.auth.currentUser!=null){
        Navigator.pushReplacementNamed(context, '/home');

      }
      if(Apis.auth.currentUser == null){
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Media Query
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome To CHIT-CHAT"),
      ),
      body: Stack(
        children: [
          Positioned(
            top: mq.height * .15,
            width: mq.width * .50,
            left: mq.width * .25,
            child: Image.asset("images/chat.png"),
          ),
          Positioned(
              bottom: mq.height * .07,
              left: mq.width * .19,
              // width: mq.width * .9,
              // height: mq.height *.06,
              child: const Text(
                "made by SINGH TARUN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
