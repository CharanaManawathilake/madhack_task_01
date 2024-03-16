import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late SharedPreferences _prefs;
  late String _storedToken;

  @override
  void initState() {
    super.initState();
    _loadStoredInformation();
  }

  Future<void> _loadStoredInformation() async {
    _prefs = await SharedPreferences.getInstance();
    _storedToken = _prefs.getString('token') ?? ''; // Retrieve the stored token
    setState(() {}); // Update the UI after retrieving the information
  }

  Future<void> _signOut() async {
    await _prefs.remove('token'); // Remove the token from SharedPreferences
    // Navigate to sign-in page or perform any other sign-out related tasks
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Dashboard'),
        GestureDetector(
          onTap: _signOut,
          child: Text('Sign Out'),
        ),
      ],
    );
  }
}
