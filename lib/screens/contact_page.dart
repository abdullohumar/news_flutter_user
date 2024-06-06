import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact Page'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 90.0,
                        backgroundColor: Colors.purple,
                        child: Text(
                          'UP',
                          style: TextStyle(fontSize: 70.0),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 35,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Admin',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.email, size: 35),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'try@kumbang.com',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone, size: 35),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '+62 123 456 789',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_month, size: 35),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '2023 - 2024',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Copyright © 2024 - All Rights Reserved'),
                )
              ],
            ),
          ),
        )
      );
  }
}
