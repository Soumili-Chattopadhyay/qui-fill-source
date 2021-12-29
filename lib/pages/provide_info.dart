import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quifill/pages/signed_document.dart';
import 'package:quifill/widget/global_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class GetInfo extends StatefulWidget {
  const GetInfo({Key? key}) : super(key: key);

  @override
  _GetInfoState createState() => _GetInfoState();
}

class _GetInfoState extends State<GetInfo> {
  final String _githubLink = "https://github.com/Soumili-Chattopadhyay";

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  TextEditingController idController = TextEditingController();

  Future<void> launchGitHub() async {
    if (!await launch(_githubLink)) throw 'Could not launch $_githubLink';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: getDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        shadowColor: Colors.blueGrey,
        title: const Text(
          "Qui-Fill",
          textScaleFactor: 1.5,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            const Flexible(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Enter your personal ID number: ",
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            const Flexible(child: SizedBox(height: 15.0, width: 15.0)),
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: idController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      labelText: "ID number from dataset",
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: TextButton(
                onPressed: () {
                  if (idController.text.length == 12) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SignedDocument()));
                  } else {
                    Fluttertoast.showToast(
                        msg:
                            "Please enter personal ID number from the given dataset!");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "PROCEED",
                    textScaleFactor: 1.1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: TextButton(
                onPressed: () => launch(
                    'https://github.com/Soumili-Chattopadhyay/qui-fill-source'),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Sample ID at: https://github.com/Soumili-Chattopadhyay/qui-fill-source",
                    textScaleFactor: 1.1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
