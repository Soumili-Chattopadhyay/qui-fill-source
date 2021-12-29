import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quifill/database/aadhaar_dataset.dart';
import 'package:quifill/main.dart';
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
  TextEditingController otpController = TextEditingController();

  Future<void> launchGitHub() async {
    if (!await launch(_githubLink)) throw 'Could not launch $_githubLink';
  }

  bool otpActivated = false;

  Aadhaar? sessionData;

  var _accountGroupValue;

  Map getAadhaarDetails(String input) {
    for (var i = 0; i < aadhaarDataset.length; i++) {
      if (aadhaarDataset[i].id == input) {
        setState(() {
          sessionData = aadhaarDataset[i];
        });
        return {
          'available': true,
          'data': aadhaarDataset[i],
        };
      }
    }
    return {
      'available': false,
      'data': null,
    };
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
      body: Center(
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    (otpActivated)
                        ? "Enter the sent OTP: "
                        : "Enter your personal ID number: ",
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
                      controller: (otpActivated) ? otpController : idController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.5,
                          ),
                        ),
                        labelText: (otpActivated)
                            ? "One-Time Password"
                            : "ID number from dataset",
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: TextButton(
                  onPressed: () {
                    if (otpActivated) {
                      if (otpController.text == "745698") {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SignedDocument(
                                  userData: sessionData!,
                                  accountType: _accountGroupValue.toString(),
                                )));
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please enter correct OTP!");
                      }
                    } else {
                      if (idController.text.length == 12 &&
                          _accountGroupValue != null) {
                        if (getAadhaarDetails(idController.text)['available']) {
                          setState(() {
                            otpActivated = true;
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg:
                                  "Aadhaar user not found :( Please enter personal ID number from the given dataset!");
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg:
                                "Please enter personal ID number from the given dataset and also specify account type!");
                      }
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
                child: (!otpActivated)
                    ? TextButton(
                        onPressed: () => launch(
                            'https://github.com/Soumili-Chattopadhyay/qui-fill-source/blob/main/lib/database/aadhaar_dataset.dart'),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Sample ID at: https://github.com/Soumili-Chattopadhyay/qui-fill-source/blob/main/lib/database/aadhaar_dataset.dart",
                            textScaleFactor: 1.1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Use OTP as 745698 to continue ...",
                          textScaleFactor: 1.1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
              (!otpActivated)
                  ? Flexible(
                      child: (MediaQuery.of(context).size.height <
                              MediaQuery.of(context).size.width)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Flexible(
                                  child: Text(
                                    "Select account type: ",
                                    textScaleFactor: 1.3,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                Flexible(
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 300.0),
                                    child: RadioListTile(
                                      value: "Savings Account",
                                      groupValue: _accountGroupValue,
                                      title: const Text("Savings Account"),
                                      onChanged: (value) {
                                        setState(() {
                                          _accountGroupValue = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 300.0),
                                    child: RadioListTile(
                                      value: "Current Account",
                                      groupValue: _accountGroupValue,
                                      title: const Text("Current Account"),
                                      onChanged: (value) {
                                        setState(() {
                                          _accountGroupValue = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Flexible(
                                  child: Text(
                                    "Select account type: ",
                                    //  textScaleFactor: 1.1,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                Flexible(
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 250.0),
                                    child: RadioListTile(
                                      value: "Savings Account",
                                      groupValue: _accountGroupValue,
                                      title: const Text("Savings Account"),
                                      onChanged: (value) {
                                        setState(() {
                                          _accountGroupValue = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 250.0),
                                    child: RadioListTile(
                                      value: "Current Account",
                                      groupValue: _accountGroupValue,
                                      title: const Text("Current Account"),
                                      onChanged: (value) {
                                        setState(() {
                                          _accountGroupValue = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
