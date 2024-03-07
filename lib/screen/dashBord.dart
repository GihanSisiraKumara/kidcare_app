import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidcare/screen/bellBord.dart';
import 'package:kidcare/screen/callBord.dart';
import 'package:kidcare/screen/connectBord.dart';
import 'package:kidcare/screen/eBord.dart';
import 'package:kidcare/screen/locationBord.dart';
import 'package:kidcare/screen/notificationBord.dart';
import 'package:kidcare/screen/shedulBord.dart';
import 'package:kidcare/screen/viewBord.dart';

class DashBord extends StatelessWidget {
  const DashBord({Key? key}) : super(key: key);

  @override
  // Import Cupertino package

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              //color: Color.fromARGB(255, 85, 11, 56),
              gradient: LinearGradient(colors: [
                Color(0xff281537),
                Color(0xffB81736),
              ]),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 236, 115,
                            107), // Change this to your desired color
                      ),
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Children!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('KIDCARE',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  trailing: const CircleAvatar(
                    radius: 30,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              //color: Color.fromARGB(255, 85, 11, 56),
              gradient: LinearGradient(colors: [
                Color(0xff281537),
                Color(0xffB81736),
              ]),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 35,
                children: [
                  itemDashboard(
                    'Connect \n& Parent',
                    CupertinoIcons.person_2,
                    const Color.fromARGB(255, 212, 138, 88),
                    context,
                    () {
                      // Use the function to navigate to the desired page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ConnectScreen(title: 'Analytics & Exam'),
                        ),
                      );
                    },
                  ),
                  itemDashboard(
                    'View Shedule',
                    CupertinoIcons.graph_circle,
                    const Color.fromARGB(255, 217, 70, 82),
                    context,
                    () {
                      // Use the function to navigate to the desired page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const viewBord(title: 'Analytics & Exam'),
                        ),
                      );
                    },
                  ),
                  itemDashboard(
                    'Emergency \n Bell',
                    CupertinoIcons.chat_bubble_2,
                    const Color.fromARGB(255, 219, 31, 28),
                    context,
                    () {
                      // Use the function to navigate to the desired page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const bellBord(title: 'Analytics & Exam'),
                        ),
                      );
                    },
                  ),
                  itemDashboard(
                    'Notification',
                    CupertinoIcons.add_circled,
                    const Color.fromARGB(255, 244, 7, 70),
                    context,
                    () {
                      // Use the function to navigate to the desired page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const notificationBord(title: 'Analytics & Exam'),
                        ),
                      );
                    },
                  ),
                  itemDashboard(
                    'Emergency \n Service',
                    CupertinoIcons.question_circle,
                    const Color.fromARGB(255, 241, 94, 126),
                    context,
                    () {
                      // Use the function to navigate to the desired page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const eBord(title: 'Analytics & Exam'),
                        ),
                      );
                    },
                  ),
                  itemDashboard(
                    'Voice & Call',
                    CupertinoIcons.phone,
                    const Color.fromARGB(255, 218, 25, 57),
                    context,
                    () {
                      // Use the function to navigate to the desired page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const callBord(title: 'Analytics & Exam'),
                        ),
                      );
                    },
                  ),
                  itemDashboard(
                    'Shere Location',
                    CupertinoIcons.location,
                    const Color.fromARGB(255, 88, 241, 170),
                    context,
                    () {
                      // Use the function to navigate to the desired page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const locationBord(title: 'Analytics & Exam'),
                        ),
                      );
                    },
                  ),
                  itemDashboard(
                    'Day\n Sheduling',
                    CupertinoIcons.add_circled,
                    const Color.fromARGB(255, 244, 7, 70),
                    context,
                    () {
                      // Use the function to navigate to the desired page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SheduleBord(title: 'Analytics & Exam'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget itemDashboard(
    String title,
    IconData iconData,
    Color background,
    BuildContext context,
    VoidCallback onTap,
  ) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(title.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      );
}
