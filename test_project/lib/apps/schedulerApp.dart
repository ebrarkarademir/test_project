import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SchedulerApp extends StatefulWidget {
  @override
  _SchedulerAppState createState() => _SchedulerAppState();
}

class _SchedulerAppState extends State<SchedulerApp> {
  List<dynamic> tasks = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  fetchTasks() async {
    setState(() {
      isLoading = true;
    });
    var headers = {'Content-Type': 'application/json'};
    var dio = Dio();

    try {
      var response = await dio.post(
        'https://5eb6zaj2wb.execute-api.eu-central-1.amazonaws.com/dev/bot-api/task',
        data: {"task_number": 3},
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 &&
          response.data['body'] != null &&
          response.data['body']['tasks'] != null) {
        setState(() {
          tasks = List<dynamic>.from(response.data['body']['tasks']);
          isLoading = false;
          print(response.data['body']['tasks']);
        });
      } else {
        print(response.statusCode);
        print(response.data['body']);
        print('Unexpected response format or null tasks received');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error making API call: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scheduler App')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task['task_code']),
                  subtitle: Text(task['statusName']),
                  trailing: Text(task['priorityName']),
                );
              },
            ),
    );
  }
}
