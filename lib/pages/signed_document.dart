import 'package:flutter/material.dart';
import 'package:quifill/database/aadhaar_dataset.dart';
import 'package:quifill/main.dart';
import 'package:quifill/widget/global_drawer.dart';

class SignedDocument extends StatefulWidget {
  final Aadhaar userData;
  final String accountType;

  const SignedDocument(
      {Key? key, required this.userData, required this.accountType})
      : super(key: key);

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
      backgroundColor: Colors.grey.shade800,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () => QuiFill.restartApp(context),
              child: const Text(
                "Restart Bot",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(12.0),
        child: Center(
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: ColoredBox(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Qui Accounts Pvt. Ltd.",
                        textScaleFactor: 2.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Center(
                              child: Text(
                                "Name: ${widget.userData.name}",
                                textScaleFactor: 1.3,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Center(
                              child: Text(
                                "Phone: ${widget.userData.phone}",
                                textScaleFactor: 1.3,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Center(
                              child: Text(
                                "E-mail: ${widget.userData.mail}",
                                textScaleFactor: 1.3,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Center(
                              child: Text(
                                "Address: ${widget.userData.address}",
                                textScaleFactor: 1.3,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Center(
                              child: Text(
                                "Applied for: ${widget.accountType}",
                                textScaleFactor: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                const Expanded(
                                  child: Center(
                                    child: Text(
                                      "Digitally Signed: ",
                                      textScaleFactor: 1.3,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                      child:
                                          Image.asset('assets/images/sign.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Center(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset('assets/images/aadhaar.png'),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
