import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: 720,
              ),
              padding: EdgeInsets.fromLTRB(30, 80, 30, 60),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(143, 148, 251, 1)))),
                        child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey[700]),
                            ))),
                    Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(143, 148, 251, 1)))),
                        child: TextField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey[700]),
                            ))),
                    GestureDetector(
                        onTap: () async {
                          var url =
                              Uri.http("localhost:4000", "/api/auth/signin");
                          var response = await http.post(url, body: {
                            "email": email.text,
                            "password": password.text,
                          });

                          if (response.statusCode == 200) {
                            Navigator.pushNamed(context, '/dashboard');
                            var token =
                                jsonDecode(response.body)['data']['token'];
                            final SharedPreferences? prefs = await _prefs;
                            await prefs?.setString('token', token);
                          } else {
                            print("ERROR");
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
