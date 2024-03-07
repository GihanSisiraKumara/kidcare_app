import 'package:flutter/material.dart';

class bellBord extends StatelessWidget {
  const bellBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Bell!"),
      ),
      body: const Center(
        child: Text(' Bell!'),
      ),
    );
  }
}
