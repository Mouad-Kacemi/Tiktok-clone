import 'package:flutter/material.dart';
import 'package:islam_tiktok/constants.dart';
import 'package:islam_tiktok/views/screens/auth/login_screen.dart';
import 'package:islam_tiktok/views/widgets/text_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Tiktok Clone',
            style: TextStyle(
                fontSize: 35, color: buttonColor, fontWeight: FontWeight.w900),
          ),
          Text(
            'Register',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/images/profile.png')),
              Positioned(
                child: IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: () {
                    authcontroller.pickImage();
                  },
                ),
                bottom: -10,
                left: 80,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _usernameController,
              labelText: 'Username',
              icon: Icons.person,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _emailController,
              labelText: 'Email',
              icon: Icons.email,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _passwordController,
              labelText: 'Password',
              icon: Icons.lock,
              isObsecure: true,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: InkWell(
              onTap: () {
                authcontroller.registerUser(
                    _usernameController.text,
                    _emailController.text,
                    _passwordController.text,
                    authcontroller.ProfilePhoto);
              },
              child: Center(
                  child: Text(
                "Register",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(fontSize: 20),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, color: buttonColor),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
