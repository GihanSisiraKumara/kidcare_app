import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidcare/screen/dashBord.dart';

class bellBord extends StatelessWidget {
  const bellBord({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Emergency Bell!",
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
                  'Name',
                  'Ahad Hashmi',
                  CupertinoIcons.person,
                ),
                const SizedBox(height: 20),
                itemProfile('Date', '2024/03/23'),
                const SizedBox(height: 20),
                itemProfile('Leave at Home5h', '07. 10 A.M.'),
                const SizedBox(height: 20),
                itemProfile('Arival at Scool', '07.30 A.M'),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('Dispatcher at School', '13.30 P.M'),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('In Home', '14.30 P.M'),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('In School', '07.30 A.M'),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('Out School', '13.35 P.M'),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, [IconData? iconData]) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 244, 244),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: const Color.fromARGB(255, 33, 30, 30).withOpacity(.2),
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
        // trailing: const Icon(Icons.arrow_forward,
        // color: Color.fromARGB(255, 17, 13, 13)),
        // tileColor: Colors.white,
      ),
    );
  }
}
