import 'package:flutter/material.dart';

class eBord extends StatelessWidget {
  const eBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Emergency!",
          style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 247, 84, 84),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Text('emergaemcy servicess Parents!'),
      ),
    );
  }
}
