import 'package:flutter/material.dart';
import 'package:test_project/screens/blogPage.dart';
import 'package:test_project/screens/contactPage.dart';
import 'package:test_project/screens/cvPage.dart';
import 'package:test_project/screens/homePage.dart';
import 'package:test_project/screens/portfolioPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final _pages = [
    HomePage(),
    PortfolioPage(),
    CVPage(),
    ContactPage(),
    BlogPage()
  ];

  final _pageNames = ['Home', 'Portfolio', 'CV', 'Contact', 'Blog'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Website',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Row(
          children: [
            // Sidebar Navigation
            Container(
              width: 170, // Increased width
              color: Color.fromARGB(255, 18, 145, 71),
              child: ListView.builder(
                itemCount: _pages.length,
                itemBuilder: (context, index) => _buildNavItem(
                    index: index,
                    icon: _getIconForPage(index),
                    title: _pageNames[index]),
              ),
            ),
            // Content
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
      ),
    );
  }

  IconData _getIconForPage(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.work;
      case 2:
        return Icons.book;
      case 3:
        return Icons.mail;
      case 4:
        return Icons.article;
      default:
        return Icons.home;
    }
  }

  Widget _buildNavItem(
      {required int index, required IconData icon, required String title}) {
    return ListTile(
      leading: Icon(icon,
          color: _selectedIndex == index ? Colors.yellow : Colors.white),
      title: Text(
        title,
        style: TextStyle(
            color: _selectedIndex == index ? Colors.yellow : Colors.white,
            fontSize: 18, // Increased font size
            fontWeight: FontWeight.bold // Bold font
            ),
      ),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      contentPadding:
          EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Padding
    );
  }
}
