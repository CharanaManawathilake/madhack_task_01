import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:madhack_task_01/model/user.dart';
import 'package:madhack_task_01/model/user_preferences.dart';
import 'package:madhack_task_01/pages/widgets/button_widget.dart';
import 'package:madhack_task_01/pages/widgets/numbers_widget.dart';

import 'widgets/appbar_widget.dart';
import 'widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          buildAbout(user),
          const SizedBox(height: 24),
          buildWorkExperience(user),
          const SizedBox(height: 24),
          buildEducation(user),
          const SizedBox(height: 24),
          buildQualification(user)
        ],
      ),
    )
    );
  }

Widget buildName(User user) => Center(
  child: Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  ),);

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'About me',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => {}, // onPressed function not implemented yet
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

  Widget buildWorkExperience(User user) => Container(
  padding: EdgeInsets.symmetric(horizontal: 48),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            'Work Experience',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => {}, // onPressed function not implemented yet
          ),
        ],
      ),
      const SizedBox(height: 16),
      Container(
        height: 200, // Set a fixed height or use constraints as per your design
        child: ListView.builder(
          itemCount: user.workExperience.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(user.workExperience[index]),
              // Add any other relevant information from the work experience object here
            );
          },
        ),
      ),
    ],
  ),
);

  Widget buildEducation(User user) => Container(
  padding: EdgeInsets.symmetric(horizontal: 48),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            'Education',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => {}, // onPressed function not implemented yet
          ),
        ],
      ),
      const SizedBox(height: 16),
      Container(
        height: 200, // Set a fixed height or use constraints as per your design
        child: ListView.builder(
          itemCount: user.education.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(user.education[index]),
              // Add any other relevant information from the work experience object here
            );
          },
        ),
      ),
    ],
  ),
);

Widget buildQualification(User user) => Container(
  padding: EdgeInsets.symmetric(horizontal: 48),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            'Qualifications',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => {}, // onPressed function not implemented yet
          ),
        ],
      ),
      const SizedBox(height: 16),
      Container(
        height: 200, // Set a fixed height or use constraints as per your design
        child: ListView.builder(
          itemCount: user.qualifications.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(user.qualifications[index]),
              // Add any other relevant information from the work experience object here
            );
          },
        ),
      ),
    ],
  ),
);

}
