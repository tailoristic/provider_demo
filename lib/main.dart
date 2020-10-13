import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'secondPage.dart';

void main() {
  runApp(MyApp());
}

class CounterData extends ChangeNotifier {
  int _counter = 60;
  int getCounter() => _counter;
  updateCounter() {
    _counter--;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CounterData(),
        builder: (context, index) {
          return MaterialApp(
            title: 'Provider',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<CounterData>(context);
    print("IM NoT Coming back");
    return Scaffold(
      appBar: AppBar(
        title: Text("Im a Rider, Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Im going down',
            ),
            Consumer<CounterData>(
              builder: (context, data, child) {
                return Text(
                  data.getCounter().toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
