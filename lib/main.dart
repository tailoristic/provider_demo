import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/theme.dart';

import 'secondPage.dart';

Future<void> main() async {
  await _initApp();
  runApp(MyApp());
}

Future _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  var themeBox = await Hive.openBox('theme');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeMan(),
      builder: (context, index) {
        return MaterialApp(
          title: 'Provider',
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          themeMode: Provider.of<ThemeMan>(context).getTheme()
              ? ThemeMode.dark
              : ThemeMode.light,
          home: MyHomePage(),
        );
      },
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
    //var count = Provider.of<CounterData>(context);
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
            // Consumer<CounterData>(
            //   builder: (context, data, child) {
            //     return Text(
            //       data.getCounter().toString(),
            //       style: Theme.of(context).textTheme.headline4,
            //     );
            //   },
            // ),
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
