import 'package:flutter/material.dart';

class CVPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CV')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "Mehmet Ebrar Karademir",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('+90 (555) 554-5226 • ebrarkarademir999@gmail.com'),
              Text('linkedin.com/in/ebrar-karademir • Bursa / Turkey'),
              SizedBox(height: 20),

              // Education Section
              buildSection(
                'EDUCATION',
                Column(
                  children: [
                    buildTile(
                        'Marmara University, Istanbul/Turkey',
                        '2018 - present',
                        'Engineering Faculty, Instrumentation Engineering Department'),
                    // Add more education details as needed
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Experience Section
              buildSection(
                'PROFESSIONAL EXPERIENCES',
                Column(
                  children: [
                    buildTile(
                        'Software Engineer Intern, Innoppia, Rotterdam/Netherlands',
                        '2023 April – present',
                        'Lorem ipsum description here...'),
                    // Add more job experiences as needed
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Skills Section
              buildSection(
                'TECHNICAL SKILLS',
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: [
                    Chip(label: Text('Python')),
                    Chip(label: Text('Flutter')),
                    // Add more skills as Chips
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Other sections...
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection(String title, Widget content) {
    return ExpansionTile(
      title: Text(title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      children: [content],
    );
  }

  Widget buildTile(String title, String subtitle, String content) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // On tap action or navigation if required
      },
    );
  }
}
