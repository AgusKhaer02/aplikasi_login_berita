import 'package:aplikasi_login_berita/pages/home.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  bool isPassVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.purple,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: txtUsername,
                decoration: InputDecoration(
                  labelText: "username",
                  hintText: "Enter Username...",
                ),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txtPassword,
                obscureText: isPassVisible,
                decoration: InputDecoration(
                    labelText: "password",
                    hintText: "Enter Password...",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (isPassVisible == true) {
                            isPassVisible = false;
                          } else {
                            isPassVisible = true;
                          }
                        });
                      },
                      icon: (isPassVisible == true)
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    )),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // print(txtUsername.text);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                ),
              ),
              TextButton(
                onPressed: () {
                  print("Forgot Password");
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  print("sign up");
                },
                child: Text(
                  "Don't have an account? Sign up here?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
