import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrl(String _url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}

Drawer getDrawer() => Drawer(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text(
                "Source Code ( Flutter )",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => launchUrl(
                  'https://github.com/Soumili-Chattopadhyay/qui-fill-source'),
              shape: const StadiumBorder(),
              tileColor: Colors.blue,
            ),
            const SizedBox(height: 15.0),
            ListTile(
              title: const Text(
                "Compiled Code ( WebApp )",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => launchUrl(
                  'https://github.com/Soumili-Chattopadhyay/qui-fill'),
              shape: const StadiumBorder(),
              tileColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
