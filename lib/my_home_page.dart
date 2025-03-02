import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  DateTime? lastPressed;

  final List<Widget> _screens = [
    Center(child: Text("Home Page🏠")),
    Center(child: Text("Rides 🚗")),
    Center(child: Text("Communities 👥")),
    Center(child: Text("Messages 💬")),
    Center(child: Text("Notifications 🔔")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pop Scope Demo")), 
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: "rides"),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: "communities"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "messages"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "notifications"),
        ],
      ),
    );
  }
}

