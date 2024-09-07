// ignore_for_file: prefer_const_constructors, use_build_context_synchronously,, unnecessary_null_comparison
// unnecessary_null_comparison

import 'package:doctors_appointment/BottomNavBar/bottomNav.dart';
import 'package:doctors_appointment/SignUp/signUp.dart';
import 'package:doctors_appointment/home/homeScreen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool state = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordState() {
    setState(() {
      state = !state;
    });
    return state;
  }

  Future loginUser() async {
    try {
      final Future<SharedPreferences> Prefs = SharedPreferences.getInstance();
      final user = FirebaseAuth.instance;
      final _user = await user.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (_user != null) {
        final SharedPreferences prefs = await Prefs;
        prefs.setBool('loginState', true);
        prefs.setString('email', emailController.text);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
      }
    } catch (error) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: Text(error.toString()),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Login'),
      ),
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.lock,
                  size: 50,
                  color: Colors.blueGrey[900],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      state == false ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onTap: () => passwordState(),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                obscureText: state,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  loginUser();
                },
                // ---------- ### -----------

                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'new user?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpApp()));
                    },
                    child: Text(
                      'signUP',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
