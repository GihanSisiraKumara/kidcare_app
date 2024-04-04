import 'package:flutter/material.dart';

class parentcallBord extends StatelessWidget {
  const parentcallBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("child!"),
      ),
      body: const Center(
        child: Text('emergaemcy servicess Parents!'),
      ),
    );
  }
}
