import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class aboutBord extends StatelessWidget {
  const aboutBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("about"),
      ),
      body: Container(
        child: Lottie.asset('assets/animations/Animation - 1.json'),
      ),
    );
  }
}
