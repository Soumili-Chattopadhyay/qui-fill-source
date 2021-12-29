import 'package:flutter/material.dart';
import 'package:quifill/pages/provide_info.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String _url =
      'https://github.com/Soumili-Chattopadhyay/qui-fill-source';

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Flexible(
              child: Text(
                "Qui-Fill: automatic e-filling",
                textScaleFactor: 5.0,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Flexible(
              child: SizedBox(height: 15.0),
            ),
            Flexible(
              child: TextButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const GetInfo())),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.2))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Start Now",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 3.0),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            /* const Flexible(
              flex: 2,
              child: SizedBox(height: 30.0),
            ),*/
            Expanded(
              child: Container(),
            ),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75),
                child: const Text(
                  "DISCLAIMER : Qui-Fill uses Indian Aadhaar concept for its proceedings. Due to security purpose, none of the real data is used in this project, a hypothetical dataset is being created. Please click on the below link to access the dataset and use it for testing the project!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Flexible(
              child: SizedBox(height: 3.0),
            ),
            Flexible(
              child: GestureDetector(
                onTap: () => _launchURL(),
                child: const Text(
                  "CLICK HERE!",
                  textScaleFactor: 1.1,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
