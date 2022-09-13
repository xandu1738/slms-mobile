// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slms/widgets/list_tile.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(
                'Settings',
                style: GoogleFonts.abel(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomListTile(
                leadingIcon: Icons.person,
                titleText: 'Account',
                //subs: 'Make Your account settings here',
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomListTile(
                leadingIcon: Icons.spa,
                titleText: 'Preference',
                //subs: 'Set your preferences here',
              ),
              SizedBox(
                height: 5,
              ),
              CustomListTile(
                leadingIcon: Icons.info,
                titleText: 'Your Information',
                //subs: 'Tell us how we can use your information',
              ),
              SizedBox(
                height: 5,
              ),
              CustomListTile(
                leadingIcon: Icons.call,
                titleText: 'Contact Us',
                //subs: 'Reach our help desk for technical help',
              ),
              SizedBox(
                height: 5,
              ),
              CustomListTile(
                leadingIcon: Icons.shield_moon,
                titleText: 'Terms & Privacy Policy',
                //subs: 'Read our terms of operation, and privacy policy',
              ),
              SizedBox(
                height: 5,
              ),
              CustomListTile(
                leadingIcon: Icons.question_answer,
                titleText: 'App Information',
                //subs: 'Licences and other certifications',
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
