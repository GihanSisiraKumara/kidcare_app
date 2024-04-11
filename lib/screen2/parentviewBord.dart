import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidcare/screen/shedulBord.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/red2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/kidcare.png'),
                ),
                const SizedBox(height: 20),
                itemProfile(
                  'Name',
                  'Ahad Hashmi',
                  CupertinoIcons.person,
                ),
                const SizedBox(height: 20),
                itemProfile('Date', '2024/03/23', CupertinoIcons.calendar),
                const SizedBox(height: 20),
                itemProfile(
                    'Leave at Home', '07. 10 A.M.', CupertinoIcons.time),
                const SizedBox(height: 20),
                itemProfile(
                    'Arival at Scool', '07.30 A.M', CupertinoIcons.time),
                const SizedBox(
                  height: 20,
                ),
                itemProfile(
                    'Dispatcher at School', '13.30 P.M', CupertinoIcons.time),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('In Home', '14.30 P.M', CupertinoIcons.time),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Attendance",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 190, 88, 88),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('In School', '07.30 A.M', CupertinoIcons.time),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('Out School', '13.35 P.M', CupertinoIcons.time),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffB81736),
                        Color(0xff281537),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SheduleBord(
                                  title: '',
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors
                          .transparent, // Set primary color to transparent
                      shadowColor: Colors.transparent, // Hide shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Edit Shedule',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 238, 238),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: const Color.fromARGB(255, 85, 69, 69).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: const Icon(Icons.arrow_forward,
            color: Color.fromARGB(255, 6, 6, 6)),
        tileColor: Colors.white,
      ),
    );
  }
}
