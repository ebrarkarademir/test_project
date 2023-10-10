import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  final _urls = {
    'GitHub': 'https://github.com/ebrarkarademir',
    'LinkedIn': 'https://www.linkedin.com/in/ebrar-karademir/',
    'Twitter': 'https://twitter.com/kmebrar',
    'Mail': 'mailto:ebrarkarademir999@gmail.com',
  };

  final _icons = {
    'GitHub': Icons.code,
    'LinkedIn': Icons.work,
    'Twitter': Icons.comment,
    'Mail': Icons.email,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black, Colors.grey[850]!],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _urls.keys.map((site) {
              return InkWell(
                onTap: () async {
                  final url = _urls[site];
                  if (await canLaunch(url!)) {
                    launch(url);
                  } else {
                    print("Couldn't launch $url");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(_icons[site], color: Colors.white, size: 30),
                      SizedBox(width: 10),
                      Text(
                        site,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
