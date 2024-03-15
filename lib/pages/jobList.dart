import 'package:flutter/material.dart';
import 'package:madhack_task_01/pages/widgets/jobOpp_widget.dart';

class jobList extends StatelessWidget {
  final List<Map<String, dynamic>> jobDetails = [
    {
      'companyName': 'ABC Company',
      'jobTitle': 'Software Engineer',
      'salary': 70000.0,
    },
    {
      'companyName': 'XYZ Corporation',
      'jobTitle': 'Frontend Developer',
      'salary': 60000.0,
    },
    {
      'companyName': '123 Industries',
      'jobTitle': 'Data Analyst',
      'salary': 65000.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
      ),
      body: ListView.builder(
        itemCount: jobDetails.length,
        itemBuilder: (context, index) {
          final job = jobDetails[index];
          return JobCard(
            companyName: job['companyName'],
            jobTitle: job['jobTitle'],
            salary: job['salary'],
          );
        },
      ),
    );
  }
}