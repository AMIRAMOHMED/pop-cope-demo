import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return PopScope(
      canPop: false, 
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return; 

        if (selectedIndex == 0) {
          DateTime now = DateTime.now();
          if (lastPressed == null || now.difference(lastPressed!) > Duration(seconds: 2)) {
            lastPressed = now;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Press back again to exit")),
            );
          } else {
            if (Platform.isAndroid) {
              SystemNavigator.pop(); 
            }
          }
        } else {
          setState(() {
            selectedIndex = 0; 
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Pop Scope Demo")), 
        body: _screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black,
      
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
      ),
    );
  }
}

