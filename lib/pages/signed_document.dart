import 'package:flutter/material.dart';
import 'package:quifill/widget/global_drawer.dart';

class SignedDocument extends StatefulWidget {
  const SignedDocument({Key? key}) : super(key: key);

  @override
  _SignedDocumentState createState() => _SignedDocumentState();
}

class _SignedDocumentState extends State<SignedDocument> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

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
    );
  }
}
