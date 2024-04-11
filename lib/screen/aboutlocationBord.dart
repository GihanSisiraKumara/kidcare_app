import 'package:flutter/material.dart';
import 'package:kidcare/screen/aboutbellBord.dart';
import 'package:lottie/lottie.dart';

class aboutlocationBord extends StatelessWidget {
  const aboutlocationBord({super.key, required String title});

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
              child:
                  Lottie.asset('assets/animations/Animation - location.json'),
            ),
            const SizedBox(height: 50),
            const Text(
              "Share Your Location!!",
              style: TextStyle(
                color: Color.fromARGB(255, 185, 4, 4),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Stay in the loop and ensure your child's safety\n with our KidCare app's location-sharing feature. Share their whereabouts effortlessly for ultimate peace of mind !",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 230, 36, 36),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const aboutbellBord(
                      title: '',
                    ),
                  ),
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
