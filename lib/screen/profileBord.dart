import 'package:flutter/material.dart';

class profileBord extends StatelessWidget {
  const profileBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile!"),
      ),
      body: const Center(
        child: Text('your profile'),
      ),
    );
  }
}
