import 'package:flutter/material.dart';
import 'package:test_project/apps/randomOptionApp.dart';
import 'package:test_project/apps/sampleApp.dart';
import 'package:test_project/apps/schedulerApp.dart';

// Create an AppItem class to store app details and its widget.
class AppItem {
  final String appName;
  final String releaseDate;
  final String description;
  final String imagePath;
  final Widget appPage;

  AppItem({
    required this.appName,
    required this.releaseDate,
    required this.description,
    required this.imagePath,
    required this.appPage,
  });
}

class PortfolioPage extends StatelessWidget {
  // Create a list of apps and their details.
  final List<AppItem> apps = [
    AppItem(
      appName: 'Sample App',
      releaseDate: '01/01/2023',
      description: 'Welcome to the Sample App!',
      imagePath: 'assets/images/twitter.png',
      appPage: SampleApp(),
    ),
    AppItem(
      appName: 'Random Option App',
      releaseDate: '02/02/2023',
      description: 'Description for Random Option App',
      imagePath: 'assets/images/linkedin.png', // Adjust this path.
      appPage: RandomOptionApp(),
    ),
    AppItem(
      appName: 'Scheduler App',
      releaseDate: '08/10/2023',
      description: 'Description for Random Option App',
      imagePath: 'assets/images/linkedin.png', // Adjust this path.
      appPage: SchedulerApp(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Portfolio')),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: apps.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => apps[index].appPage,
              ));
            },
            child: PortfolioCard(app: apps[index]),
          );
        },
      ),
    );
  }
}

class PortfolioCard extends StatelessWidget {
  final AppItem app;

  PortfolioCard({required this.app});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              app.imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  app.appName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Release Date: ${app.releaseDate}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  app.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => app.appPage,
                    ));
                  },
                  child: Text('View App'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
