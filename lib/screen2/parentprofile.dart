import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class parentprofile extends StatelessWidget {
  const parentprofile({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 194, 193),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 250, 251),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 250, 202, 202),
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          style: ButtonStyle(
            iconSize: WidgetStateProperty.all<double>(30),
            iconColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 252, 251, 251)),
            backgroundColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 234, 117, 117)),
          ),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffB81736), Color(0xff281537)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/red2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // const SizedBox(height: 0),
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/pro.png'),
                ),
                const SizedBox(height: 20),
                itemProfile('Name', 'Ahad Hashmi', CupertinoIcons.person),
                const SizedBox(height: 20),
                itemProfile('Phone', '03107085816', CupertinoIcons.phone),
                const SizedBox(height: 20),
                itemProfile('Address', 'abc address, xyz city',
                    CupertinoIcons.location),
                const SizedBox(height: 20),
                itemProfile('Email', 'ahadhashmideveloper@gmail.com',
                    CupertinoIcons.mail),
                const SizedBox(
                  height: 20,
                ),
                itemProfile('Paasord', '**************', CupertinoIcons.lock),
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
                    onPressed: () {},
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
                      'Edit Profile',
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromARGB(255, 77, 66, 64),
                spreadRadius: 1,
                blurRadius: 2),
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
