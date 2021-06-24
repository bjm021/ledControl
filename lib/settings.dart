import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController controller = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.text = globalIPAddress;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //print(height);

    double defaultTBPadding = height / 100 + 2;
    double defaultTextSize = height / 40;

    return Scaffold(
      appBar: AppBar(
        title: Text("Einstellungen"),
        backgroundColor: Color.fromARGB(255, gRed.round(), gGreen.round(), gBlue.round()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, defaultTBPadding * 5, 20, 10),
            child: Text(
              "IP Adresse",
              style: TextStyle(fontSize: defaultTextSize),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              "Bitte geben Sie hier die IP Adresse ihres ESP32 Modules mit der espLed2 Software ein!",
              style: TextStyle(
                  fontSize: defaultTextSize - (defaultTextSize * 0.1)),
              textAlign: TextAlign.left,
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                textAlign: TextAlign.center,
                autocorrect: false,
                enableSuggestions: false,
                controller: controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte gebe etwas ein!';
                  }

                  RegExp ipExp = new RegExp(r"^(?!0)(?!.*\.$)((1?\d?\d|25[0-5]|2[0-4]\d)(\.|$)){4}$", caseSensitive: false, multiLine: false);
                  if(!ipExp.hasMatch(controller.text)){
                    return 'Bitte geben Sie eine gültige IP Adresse ein!';
                  }

                  return null;
                },
              ),
            ),
          ),
          Expanded(child: Text("")),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, defaultTBPadding*3),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, gRed.round(), gGreen.round(), gBlue.round())),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  globalIPAddress = controller.text;
                  saveIP(context, controller.text);
                }
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, defaultTBPadding, 20, defaultTBPadding),
                child: Text("Speichern"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void saveIP(BuildContext context, String text) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("esp-ip", text);
  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
}