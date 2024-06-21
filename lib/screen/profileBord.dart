import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class profileBoard extends StatefulWidget {
  const profileBoard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProfileBoardState createState() => _ProfileBoardState();
}

class _ProfileBoardState extends State<profileBoard> {
  File? _image;

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 229, 229),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _image != null
                          ? FileImage(_image!)
                          : const AssetImage('assets/images/pro.png')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: _getImage,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileItem(
                      'Name', 'Himantha nanaykkara', CupertinoIcons.person),
                  _buildProfileItem(
                      'Phone', '0767301727', CupertinoIcons.phone),
                  _buildProfileItem(
                      'Address', '36/A,Minuwanvila', CupertinoIcons.location),
                  _buildProfileItem('Email', '', CupertinoIcons.mail),
                  _buildProfileItem(
                      'Password', '**************', CupertinoIcons.lock),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: const Color(0xffB81736),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String subtitle, IconData iconData) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, color: const Color.fromARGB(255, 247, 84, 84)),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
