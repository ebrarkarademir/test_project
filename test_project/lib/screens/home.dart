import 'package:flutter/material.dart';
import 'package:test_project/constants/colors.dart';
import 'package:test_project/widgets/searchBox.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // Function to handle the button press and navigate to a new screen
  void _navigateToNewPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          // Replace 'NewPage' with the actual page you want to navigate to
          return NewPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar:
          _buildAppBar(context), // Pass the context to the _buildAppBar method
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            searchBox(),
            ElevatedButton(
              onPressed: () =>
                  _navigateToNewPage(context), // Call the navigation function
              child: Text('Go to New Page'),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBGColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              image: const DecorationImage(
                image: AssetImage('assets/images/76682003.jpeg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }
}

// Create a new page widget (replace with your actual new page)
class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Text('This is a new page! Click on me! Please!'),
      ),
    );
  }
}
