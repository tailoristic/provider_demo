import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/theme.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<ThemeMan>(
          builder: (context, data, index) {
            return Switch(
              value: data.isDark,
              onChanged: (value) {
                data.changeTheme(value);
              },
            );
          },
        ),
      ),
    );
  }
}
