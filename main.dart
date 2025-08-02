import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Status App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: StatusPage(),
    );
  }
}

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  String status = 'Loading...';

  Future<void> getStatus() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/run_status_app/api/get_run_pose.php'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        status = data['status'].toString();
      });
    } else {
      setState(() {
        status = 'Error fetching status';
      });
    }
  }

  Future<void> updateStatus(int newStatus) async {
    final response = await http.get(Uri.parse('http://10.0.2.2/run_status_app/api/update_status.php?status=$newStatus'));
    if (response.statusCode == 200) {
      getStatus(); 
    }
  }

  @override
  void initState() {
    super.initState();
    getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Status: $status',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateStatus(1); 
              },
              child: Text('Set status to 1'),
            ),
            ElevatedButton(
              onPressed: () {
                updateStatus(0);
              },
              child: Text('Set status to 0'),
            ),
          ],
        ),
      ),
    );
  }
}
