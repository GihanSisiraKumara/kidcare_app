import 'package:flutter/material.dart';

class viewBord extends StatelessWidget {
  const viewBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View!"),
      ),
      body: const Center(
        child: Text('Here your notification!'),
      ),
    );
  }
}
