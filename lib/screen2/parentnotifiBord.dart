import 'package:flutter/material.dart';

class parentnotifiBord extends StatelessWidget {
  const parentnotifiBord({super.key, required String title});

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
