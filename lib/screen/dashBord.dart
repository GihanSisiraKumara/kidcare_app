import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                Color.fromRGBO(186, 231, 205, 1),
                Color.fromARGB(255, 19, 108, 68),
              ]),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Samdi!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('Good Morning',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  trailing: const CircleAvatar(
                    radius: 30,
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: const Color.fromRGBO(186, 231, 205, 1),
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
                  itemDashboard('Analytics\n& Exam',
                      CupertinoIcons.graph_circle, Colors.green, context),
                  itemDashboard('Attendances', CupertinoIcons.person_2,
                      const Color.fromARGB(255, 153, 31, 41), context),
                  itemDashboard('Notices', CupertinoIcons.chat_bubble_2,
                      const Color.fromARGB(255, 219, 31, 28), context),
                  itemDashboard('Upload', CupertinoIcons.add_circled,
                      const Color.fromARGB(255, 244, 7, 70), context),
                  itemDashboard('About', CupertinoIcons.question_circle,
                      const Color.fromARGB(255, 241, 94, 126), context),
                  itemDashboard('Contact', CupertinoIcons.phone,
                      const Color.fromARGB(255, 218, 25, 57), context),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget itemDashboard(String title, IconData iconData, Color background,
          BuildContext context) =>
      Container(
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
      );
}
