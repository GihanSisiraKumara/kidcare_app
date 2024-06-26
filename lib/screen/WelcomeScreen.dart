import 'package:flutter/material.dart';
import 'package:kidcare/screen/aboutBord.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffB81736),
          Color(0xff281537),
        ])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
          child: Column(children: [
            const Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Welcome To Kidcare',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            // GestureDetector(
            // onTap: () {
            // Navigator.push(
            // context,
            // MaterialPageRoute(
            // builder: (context) => const LoginScreen()));
            // },
            // child: Container(
            // height: 53,
            // width: 320,
            // decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(30),
            // border: Border.all(color: Colors.white),
            // ),
            // child: const Center(
            // child: Text(
            // 'SIGN IN',
            // style: TextStyle(
            // fontSize: 20,
            // fontWeight: FontWeight.bold,
            // color: Colors.white),
            // ),
            // ),
            // ),
            // ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const aboutBord(
                              title: '',
                            )));
              },
              child: Container(
                height: 53,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                ),
                child: const Center(
                  child: Text(
                    'START',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            //const Spacer(),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Login with Social Media',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ), //
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tab(icon: Image.asset("assets/images/facebook1.png")),
                Tab(icon: Image.asset("assets/images/instergram.png")),
                Tab(icon: Image.asset("assets/images/google.webp")),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
