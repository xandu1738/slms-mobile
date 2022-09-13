import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 179, 255, 182),
                    child: Icon(
                      Icons.notification_important,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    'You have been fined shs.2000 for missing savings day',
                    style: GoogleFonts.roboto(),
                  ),
                  subtitle: Text(
                    'Tue 3rd Sept, 2022',
                    style: GoogleFonts.roboto(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 179, 255, 182),
                    child: Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    'You loan request is being processed, please wait.',
                    style: GoogleFonts.roboto(),
                  ),
                  subtitle: Text(
                    'Tue 5th Aug, 2022',
                    style: GoogleFonts.roboto(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
