import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidcare/screen/bellBord.dart';
import 'package:kidcare/screen/callBoard.dart';
import 'package:kidcare/screen/connectBord.dart';
import 'package:kidcare/screen/eservicessBord.dart.dart';
import 'package:kidcare/screen/locationBord.dart';
import 'package:kidcare/screen/notificationBord.dart';
import 'package:kidcare/screen/profileBord.dart';
import 'package:kidcare/screen/qrscannerBord.dart';
import 'package:kidcare/screen/shedulBord.dart';
import 'package:kidcare/screen/viewBord.dart';

class DashBord extends StatelessWidget {
  const DashBord({Key? key, required String title}) : super(key: key);

  @override
  // Import Cupertino package

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffB81736), Color(0xff281537)],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Handle notification icon pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const notificationBord(
                          title: '',
                        )),
              );
            },
            icon: const Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 244, 167, 167),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 236, 115, 107),
              ),
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 221, 167, 167),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 221, 167, 167),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/kidcare.png",
                    width: 2,
                    height: 2,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Color(0xffB81736),
                ),
                title: const Text(
                  'Home ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB81736),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashBord(
                        title: '',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Color(0xffB81736),
                ),
                title: const Text(
                  'Account ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB81736),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const profileBord(
                        title: '',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.person_2,
                  color: Color(0xffB81736),
                ),
                title: const Text(
                  'Connect Owner ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB81736),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConnectScreen(
                        title: '',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.location_pin,
                  color: Color(0xffB81736),
                ),
                title: const Text(
                  'Current Location ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB81736),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocationBoard(
                        title: '',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.search,
                  color: Color(0xffB81736),
                ),
                title: const Text(
                  'Emergancy Servicess ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB81736),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const eservicessBord(
                        title: '',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.notification_add,
                  color: Color(0xffB81736),
                ),
                title: const Text(
                  'Notification ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB81736),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const notificationBord(
                        title: '',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.notification_add,
                  color: Color(0xffB81736),
                ),
                title: const Text(
                  'Emergency Bell ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB81736),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const bellBord(
                        title: '',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.call,
                  color: Color(0xffB81736),
                ),
                title: const Text(
                  'Voice & Call ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB81736),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CallBoard(
                        title: '',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.add,
                  color: Color(0xffB81736),
                ),
                title: const Text(
                  'Day Sheduling ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB81736),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SheduleBord(
                        title: '',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.help,
                  color: Color(0xffB81736),
                ),
                title: const Text(
                  'Help ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffB81736),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashBord(
                        title: '',
                      ), // create help dart page
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              //color: Color.fromARGB(255, 85, 11, 56),
              gradient: LinearGradient(colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]),

              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: const Text(
                    'Hello Children!',
                    style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 252, 249, 249),
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('KIDCARE',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color.fromARGB(251, 255, 254, 254))),
                  trailing: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/kidcare.png",
                        width:
                            60, // Adjust width and height to fit the circular avatar
                        height: 60,
                        alignment: Alignment.center,
                        fit: BoxFit
                            .cover, // Ensure the image covers the entire area
                      ),
                    ),
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
                Color(0xffB81736),
                Color(0xff281537),
              ]),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              decoration: const BoxDecoration(
                // image: DecorationImage(
                // image: AssetImage("assets/images/red.jpg"), // R
                // fit: BoxFit.cover,
                // ),
                color: Color.fromARGB(255, 251, 249, 249),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(160),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 35,
                  children: [
                    // const SizedBox(height: 5),
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
                      'Emergency \n       Bell',
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
                      'Attendance \n    Scanner',
                      CupertinoIcons.qrcode_viewfinder,
                      const Color.fromARGB(255, 244, 7, 70),
                      context,
                      () {
                        // Use the function to navigate to the desired page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const qrscannerBord(title: 'Analytics & Exam'),
                          ),
                        );
                      },
                    ),
                    itemDashboard(
                      'Emergency \n Services',
                      CupertinoIcons.question_circle,
                      const Color.fromARGB(255, 241, 94, 126),
                      context,
                      () {
                        // Use the function to navigate to the desired page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const eservicessBord(title: 'Analytics & Exam'),
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
                                const CallBoard(title: 'Analytics & Exam'),
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
                                const LocationBoard(title: 'Analytics & Exam'),
                          ),
                        );
                      },
                    ),
                    itemDashboard(
                      '       Day\n Sheduling',
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
                color: Theme.of(context).primaryColor.withOpacity(.3),
                spreadRadius: 2,
                blurRadius: 7,
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
