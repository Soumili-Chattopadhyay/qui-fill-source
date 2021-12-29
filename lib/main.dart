import 'package:flutter/material.dart';
import 'package:quifill/database/aadhaar_dataset.dart';
import 'package:quifill/pages/home.dart';
import 'package:quifill/pages/signed_document.dart';

void main() {
  runApp(const QuiFill());
}

class QuiFill extends StatefulWidget {
  const QuiFill({Key? key}) : super(key: key);

  static void restartApp(BuildContext context) =>
      context.findAncestorStateOfType<_QuiFillState>()!.restartApp();

  @override
  _QuiFillState createState() => _QuiFillState();
}

class _QuiFillState extends State<QuiFill> {
  Key sessionKey = UniqueKey();

  void restartApp() => setState(() {
        sessionKey = UniqueKey();
      });

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: sessionKey,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
