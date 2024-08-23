// ignore_for_file: prefer_typing_uninitialized_variables, unused_element
import 'package:flutter/material.dart';
import 'package:mbs/src/screens/categories_screen.dart';
import 'package:mbs/src/screens/edit_pro_screen.dart';
import 'package:mbs/src/screens/home_screen.dart';
import 'package:mbs/src/screens/map_screen.dart';
import 'package:mbs/src/screens/service_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MapScreen(),
    const CategoryPage(),
    const EditProfileScreen(),
    const AddServiceScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',backgroundColor: Colors.white),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Map',backgroundColor: Colors.white),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Categories',backgroundColor: Colors.white),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages',backgroundColor: Colors.white),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile',backgroundColor: Colors.white),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
      unselectedItemColor: const Color.fromARGB(255, 165, 164, 164),
      onTap: _onItemTapped,
    );
  }
}
