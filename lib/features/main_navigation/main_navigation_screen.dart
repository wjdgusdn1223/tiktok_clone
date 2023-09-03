import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final _screens = [
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Home'),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'home',
            tooltip: 'what are you?',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.searchengin),
            label: 'search',
            tooltip: 'what are you?',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'home',
              tooltip: 'what are you?',
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.searchengin),
            label: 'search',
            tooltip: 'what are you?',
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'home',
            tooltip: 'what are you?',
            backgroundColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
