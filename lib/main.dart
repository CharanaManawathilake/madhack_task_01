import 'package:flutter/material.dart';
import 'package:madhack_task_01/screens/dashboard.dart';
import 'package:madhack_task_01/screens/home.dart';
import 'package:madhack_task_01/screens/signin.dart';
import 'package:madhack_task_01/screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Mart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: token != null ? "/dashboard" : "/",
      routes: {
        "/": (context) => const HomePage(),
        "/dashboard": (context) => Dashboard(),
        "/signup": (context) => const SignUp(),
        "/signin": (context) => const SignIn(),
      },
    );
  }
}
