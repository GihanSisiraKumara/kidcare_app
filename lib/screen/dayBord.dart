import 'package:flutter/material.dart';
import 'package:kidcare/screen/aboutlocationBord.dart';
import 'package:lottie/lottie.dart';

class dayBord extends StatelessWidget {
  const dayBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 215, 213),
      // appBar: AppBar(
      // backgroundColor: const Color.fromARGB(255, 244, 215, 213),
      // title: const Text(""),
      // ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Container(
              child: Lottie.asset('assets/animations/Animation - dayshed.json'),
            ),
            const SizedBox(height: 20),
            const Text(
              "Day sheduling!",
              style: TextStyle(
                color: Color.fromARGB(255, 185, 4, 4),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Craft the perfect day for your little one effortlessly! Dive into our KidCare app and schedule a world of fun, learning, and love with just a few taps",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 230, 36, 36),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const aboutlocationBord(
                            title: '',
                          )),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Next',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
