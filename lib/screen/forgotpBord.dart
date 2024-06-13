import 'package:flutter/material.dart';
import 'package:kidcare/screen/loginScreen.dart';

class ForgotpBord extends StatefulWidget {
  const ForgotpBord({super.key, required String title});

  @override
  State<ForgotpBord> createState() => _ForgotpBordState();
}

class _ForgotpBordState extends State<ForgotpBord> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(),
              _buildForm(),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  Widget _header() {
    return Container(
      color: const Color.fromARGB(255, 251, 251, 251),
      height: 200,
      width: double.infinity,
      child: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(
            "assets/images/forget.png",
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Reset Password",
            style: TextStyle(
                color: Color.fromARGB(255, 228, 43, 74),
                fontSize: 32,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 30),
        _buildInputField(
          emailController,
          prefixIcon: Icons.email, // Add email icon
          hintText: "Email",
        ),
        const SizedBox(height: 20),
        _buildInputField(
          passwordController,
          prefixIcon: Icons.lock,
          hintText: " New Password",
          isPassword: true,
        ),
        const SizedBox(height: 20),
        _buildInputField(
          passwordController,
          prefixIcon: Icons.lock,
          //
          hintText: " Conform Password",
          isPassword: true,
        ),
        const SizedBox(height: 20),

        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),

        const SizedBox(height: 10),
        _buildSignUpText(), // Added Sign Up text
      ],
    );
  }

  Widget _buildGreyText(String text,
      {Color color = const Color.fromARGB(255, 21, 20, 20)}) {
    return Text(
      text,
      style: TextStyle(color: color),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false, IconData? prefixIcon, String? hintText}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        hintText: hintText,
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginScreen(
                    title: '',
                  )),
        );
        // debugPrint("Email : ${emailController.text}");
        // debugPrint("Password : ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(255, 231, 97, 97),
        elevation: 15,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "RESET PASSWORD",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // ...

  Widget _buildSignUpText() {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Handle Sign Up action
        },
        child: RichText(
          text: const TextSpan(
            text: "Need more help? ",
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: "Help",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
