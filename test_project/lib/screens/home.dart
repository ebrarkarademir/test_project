import 'package:flutter/material.dart';
import 'package:test_project/constants/colors.dart';
import 'package:test_project/widgets/searchBox.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Column(children: [searchBox()])),
    );
  }

  AppBar _buildAppBar() {
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
                image: AssetImage(
                    'assets/images/76682003.jpeg'), // Replace with the actual path to your photo asset
                fit: BoxFit.cover, // You can change the fit mode as needed
              ),
              borderRadius:
                  BorderRadius.circular(20), // Optional: Add rounded corners
            ),
          )
        ],
      ),
    );
  }
}