import 'package:flutter/material.dart';

class profileBord extends StatelessWidget {
  const profileBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency!"),
      ),
      body: const Center(
        child: Text('emergaemcy servicess Parents!'),
      ),
    );
  }
}
