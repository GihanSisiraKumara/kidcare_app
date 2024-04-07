import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidcare/screen/dashBord.dart';

class bellBord extends StatelessWidget {
  const bellBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
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
        title: const Text("Emergency Bell!"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DashBord()),
                  );
                },
                child: const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/ebell2.jpg'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 130,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('Deseble Bell')),
              ),
              const SizedBox(height: 20),
              itemProfile(
                'Name                             1m',
                'Ahad Hashmi',
                CupertinoIcons.person,
              ),
              const SizedBox(height: 10),
              itemProfile(
                  'Date                               2m', '2024/03/23'),
              const SizedBox(height: 10),
              itemProfile('Leave at Home              5h', '07. 10 A.M.'),
              const SizedBox(height: 10),
              itemProfile('Arival at Scool                8h ', '07.30 A.M'),
              const SizedBox(
                height: 10,
              ),
              itemProfile('Dispatcher at School      1d', '13.30 P.M'),
              const SizedBox(
                height: 10,
              ),
              itemProfile('In Home                           1d', '14.30 P.M'),
              const SizedBox(
                height: 10,
              ),
              itemProfile('In School                         2d', '07.30 A.M'),
              const SizedBox(
                height: 10,
              ),
              itemProfile('Out School                       7d', '13.35 P.M'),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, [IconData? iconData]) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 232, 188, 188),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: const Color.fromARGB(255, 246, 244, 244).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/images/q.webp"),
        ),
        trailing: const Icon(Icons.arrow_forward,
            color: Color.fromARGB(255, 17, 13, 13)),
        tileColor: Colors.white,
      ),
    );
  }
}
