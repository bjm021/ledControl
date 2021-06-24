import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udp/udp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LEDControl',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {'/': (context) => Home(title: 'LEDControl')},
      //home: Home(title: 'LEDControl'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  double red = 0;
  double green = 0;
  double blue = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor:
            Color.fromARGB(255, red.round(), green.round(), blue.round()),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'LEDControl',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
            ),
            ListTile(
              title: Text('Gespeicherte Farben'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                "Rot: ${red.round()}",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.red[700],
                    inactiveTrackColor: Colors.red[100],
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    thumbColor: Colors.redAccent,
                    overlayColor: Colors.red.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                    tickMarkShape: RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.red[700],
                    inactiveTickMarkColor: Colors.red[100],
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.redAccent,
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    onChanged: (newVal) {
                      setState(() {
                        red = newVal;
                      });
                    },
                    label: '$red',
                    value: red,
                    min: 0,
                    max: 255,
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                "Grün: ${green.round()}",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.green[700],
                    inactiveTrackColor: Colors.green[100],
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    thumbColor: Colors.greenAccent,
                    overlayColor: Colors.green.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                    tickMarkShape: RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.green[700],
                    inactiveTickMarkColor: Colors.green[100],
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.greenAccent,
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    onChanged: (newVal) {
                      setState(() {
                        green = newVal;
                      });
                    },
                    value: green,
                    min: 0,
                    max: 255,
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                "Blau: ${blue.round()}",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.blue[700],
                    inactiveTrackColor: Colors.blue[100],
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    thumbColor: Colors.blueAccent,
                    overlayColor: Colors.green.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                    tickMarkShape: RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.blue[700],
                    inactiveTickMarkColor: Colors.blue[100],
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.blueAccent,
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    onChanged: (newVal) {
                      setState(() {
                        blue = newVal;
                      });
                    },
                    value: blue,
                    min: 0,
                    max: 255,
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(100, 100, 100, 100),
                      child: Text(
                        "",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                color: Color.fromARGB(
                    255, red.round(), green.round(), blue.round()),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            Color.fromARGB(255, red.round(), green.round(), blue.round()),
        onPressed: () {
          sendSetUDP(context, message: "R100");
        },
        tooltip: 'Increment',
        child: Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void sendSetUDP(BuildContext context, {required String message}) async {
  // creates a UDP instance and binds it to the first available network
  // interface on port 65000.
  var sender = await UDP.bind(Endpoint.any(port: Port(65000)));

  // send a simple string to a broadcast endpoint on port 65001.
  var dataLength = await sender.send(message.codeUnits,
      Endpoint.broadcast(port: Port(65001)));

  print("$dataLength bytes sent.");
}
