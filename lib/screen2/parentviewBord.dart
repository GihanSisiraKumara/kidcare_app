import 'package:flutter/material.dart';

class parentviewBord extends StatelessWidget {
  const parentviewBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 252, 250, 251),
          centerTitle: true,
          title: const Text(
            'Sheduling View',
            style: TextStyle(
                fontSize: 22,
                color: Color.fromARGB(255, 247, 84, 84),
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            style: ButtonStyle(
              iconSize: MaterialStateProperty.all<double>(30),
              iconColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 252, 251, 251)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 234, 117, 117)),
            ),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container());
  }
}
