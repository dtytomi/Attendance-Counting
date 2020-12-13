import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

enum Action { share }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Church  Attendance',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: MyHomePage(title: 'Church Attendance'),
        home: InheritedCounter(child: _MyHomePageState()));
  }
}

class InheritedCounter extends InheritedWidget {
  final Map _menCount = {'val': 0};
  final Map _womenCount = {'val': 0};
  final Map _childrenCount = {'val': 0};
  final Map _teensCount = {'val': 0};
  final Map _sum = {'val': 0};

  final Widget child;

  InheritedCounter({this.child}) : super(child: child);

  menIncreament() {
    _menCount['val']++;
  }

  menDecreament() {
    _menCount['val']--;
  }

  womenIncreament() {
    _womenCount['val']++;
  }

  womenDecreament() {
    _womenCount['val']--;
  }

  childrenIncreament() {
    _childrenCount['val']++;
  }

  childrenDecreament() {
    _childrenCount['val']--;
  }

  teensIncreament() {
    _teensCount['val']++;
  }

  teensDecreament() {
    _teensCount['val']--;
  }

  totalSum() {
    _sum['val'] = _teensCount['val'] +
        _childrenCount['val'] +
        _womenCount['val'] +
        _menCount['val'];
  }

  resetCounter() {
    _teensCount['val'] = 0;
    _childrenCount['val'] = 0;
    _womenCount['val'] = 0;
    _menCount['val'] = 0;
    _sum['val'] = 0;
  }

  get menCount => _menCount['val'];
  get womenCount => _womenCount['val'];
  get childrenCount => _childrenCount['val'];
  get teensCount => _teensCount['val'];
  get sum => _sum['val'];

  @override
  bool updateShouldNotify(InheritedCounter oldWidget) => true;

  static InheritedCounter of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedCounter>();
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      int menCount = InheritedCounter.of(context).menCount;
      Function menIncreament = InheritedCounter.of(context).menIncreament;
      Function menDecreament = InheritedCounter.of(context).menDecreament;

      int womenCount = InheritedCounter.of(context).womenCount;
      Function womenIncreament = InheritedCounter.of(context).womenIncreament;
      Function womenDecreament = InheritedCounter.of(context).womenDecreament;

      int childrenCount = InheritedCounter.of(context).childrenCount;
      Function childrenIncreament =
          InheritedCounter.of(context).childrenIncreament;
      Function childrenDecreament =
          InheritedCounter.of(context).childrenDecreament;

      int teensCount = InheritedCounter.of(context).teensCount;
      Function teensIncreament = InheritedCounter.of(context).teensIncreament;
      Function teensDecreament = InheritedCounter.of(context).teensDecreament;

      int sum = InheritedCounter.of(context).sum;
      Function totalSum = InheritedCounter.of(context).totalSum;

      Function resetCounter = InheritedCounter.of(context).resetCounter;

      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Church Attendance'),
          actions: [
            PopupMenuButton<Action>(
              icon: Icon(Icons.more_vert),
              onSelected: (Action result) {
                share(context);
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: Action.share,
                  child: Row(
                    children: <Widget>[Text('Share'), Icon(Icons.share_sharp)],
                  ),
                ),
              ],
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    'Men:',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  )),
                  IconButton(
                    color: Colors.red,
                    icon:
                        Icon(Icons.remove_circle, size: 40),
                    onPressed: () => setState(() => menDecreament()),
                  ),
                  Expanded(
                    child: Text(
                      '$menCount',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    )
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.green,
                      size: 43,
                    ),
                    onPressed: () => setState(() => menIncreament()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      'Women:',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )),
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                        size: 43,
                      ),
                      onPressed: () => setState(() => womenDecreament()),
                    ),
                    Expanded(
                        child: Text(
                      '$womenCount',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    )),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                        size: 43,
                      ),
                      onPressed: () => setState(() => womenIncreament()),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      'Children:',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )),
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                        size: 43,
                      ),
                      onPressed: () => setState(() => childrenDecreament()),
                    ),
                    Expanded(
                        child: Text(
                      '$childrenCount',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    )),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        size: 43,
                        color: Colors.green,
                      ),
                      onPressed: () => setState(() => childrenIncreament()),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Expanded(
                        child: Text(
                      'Teens:',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )),
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                        size: 43,
                      ),
                      onPressed: () => setState(() => teensDecreament()),
                    ),
                    Expanded(
                        child: Text(
                      '$teensCount',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    )),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                        size: 43,
                      ),
                      onPressed: () => setState(() => teensIncreament()),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Expanded(
                        child: Text(
                      'Total:',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      '$sum',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    )),
                    RaisedButton(
                      color: Colors.green,
                      child: Text(
                        'Sum',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => setState(() => totalSum()),
                    )
                  ]),
              SizedBox(height: 10),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => resetCounter()),
          tooltip: 'Reset',
          child: Icon(Icons.refresh),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}

share(BuildContext context) {
  final RenderBox box = context.findRenderObject();

  int teensCount = InheritedCounter.of(context).teensCount;
  int menCount = InheritedCounter.of(context).menCount;
  int childrenCount = InheritedCounter.of(context).childrenCount;
  int womenCount = InheritedCounter.of(context).womenCount;
  int sum = InheritedCounter.of(context).sum;

  var now = new DateTime.now();

  Share.share(
      'Attendance for $now \nMen: $menCount \nWomen: $womenCount  \n'
      'Girls: $childrenCount  \nBoys: $teensCount  \n'
      'Total = $sum',
      subject: "Attendance for $now",
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}
