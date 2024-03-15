// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart' as toast;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  String dropdownValue = 'jobApplicant';

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
	                            border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
	                      ),
                        child: TextField(
                            controller: name,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name',
                              hintStyle: TextStyle(color: Colors.grey[700]),
                            ))),
                    Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
	                      ),
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
	                            border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
	                      ),
                        child: TextField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey[700]),
                            ))),
                    Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
	                      ),
                        child: TextField(
                            controller: confirm_password,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm password',
                              hintStyle: TextStyle(color: Colors.grey[700]),
                            ))),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
	                    ),
                      
                      child: DropdownButton<String>(
                      
                        isExpanded: true,
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        
                        items: <String>['jobApplicant', 'employer']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: EdgeInsets.all(8.0), // Adjust padding here
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          // Navigator.pushNamed(context, '/');
                          var url =
                              Uri.http("localhost:4000", "/api/auth/signup");
                          // var response = await http.post(url, body: {});
                          // print(response.body);
                          var response = await http.post(url, body: {
                            "name": name.text,
                            "email": email.text,
                            "password": password.text,
                            "confirm_password": confirm_password.text,
                            "role": dropdownValue
                          });
                          // print(response.statusCode);

                          if (response.statusCode == 200) {
                            Navigator.pushNamed(context, '/');
                          } else {
                            // Fluttertoast.showToast(msg: "Error occured");
                            print(response.body);
                            // I can't add a fluttertoast notificatoin, it keeps creating a breakpoint
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ]
                            )
                          ),
                          child: Center(
                            child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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