import 'package:flutter/material.dart';

import 'nav-screens/home.dart';
import 'nav-screens/invite.dart';
import 'nav-screens/loans.dart';
import 'nav-screens/savings.dart';
import 'nav-screens/settings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //List<String> _titles = ["Home", "Profile", "Shop"];
  final List<Widget> _items = [
    const Home(),
    const Savings(),
    const Loans(),
    const Invite(),
    const Settings(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: IndexedStack(
              index: _selectedIndex,
              children: _items
          )//_items.elementAt(_index),
      ),
      bottomNavigationBar: _showBottomNav(),
    );
  }

  Widget _showBottomNav()
  {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on),
          label: 'Savings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_outlined),
          label: 'Loans',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add),
          label: 'Invite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 12, 24, 59),
      unselectedItemColor: const Color.fromARGB(255, 0, 95, 55),
      onTap: _onTap,
    );
  }

  void _onTap(int index)
  {
    _selectedIndex = index;
    setState(() {

    });
  }
}