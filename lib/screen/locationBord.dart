import 'package:flutter/material.dart';

class locationBord extends StatelessWidget {
  const locationBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shere location!"),
      ),
      body: const Center(
        child: Text(' Location!'),
      ),
    );
  }
}
