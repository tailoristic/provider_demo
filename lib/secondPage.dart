import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/main.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<CounterData>(context);
    return Consumer<CounterData>(builder: (context, data, child) {
      return Scaffold(
        body: InkWell(
          onTap: () {
            count.updateCounter();
          },
          child: Center(
            child: Text(
              data.getCounter().toString(),
            ),
          ),
        ),
      );
    });
  }
}
