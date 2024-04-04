import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bellBord extends StatelessWidget {
  const bellBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Bell!"),
      ),
      body: Padding(
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
                'Name',
                'Ahad Hashmi',
                CupertinoIcons.person,
              ),
              const SizedBox(height: 10),
              itemProfile('Date', '2024/03/23', CupertinoIcons.calendar),
              const SizedBox(height: 10),
              itemProfile('Leave at Home', '07. 10 A.M.', CupertinoIcons.time),
              const SizedBox(height: 10),
              itemProfile('Arival at Scool', '07.30 A.M', CupertinoIcons.time),
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
              itemProfile('In School', '07.30 A.M', CupertinoIcons.time),
              const SizedBox(
                height: 20,
              ),
              itemProfile('Out School', '13.35 P.M', CupertinoIcons.time),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
