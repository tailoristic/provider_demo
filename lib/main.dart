import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => Counter(),
        builder: (context, index) {
          return MyHomePage();
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<Counter>(context, listen: false);
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
            Consumer<Counter>(
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
          count.updateCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
