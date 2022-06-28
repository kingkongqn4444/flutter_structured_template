import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../utils/alerts.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Alerts.showInfoSnackbar('Some Error');
            },
            child: const Text('Show Snackbar'),
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseCrashlytics.instance.recordError(
                    'some error', null,
                    reason: 'Error in Home', fatal: true);
              },
              child: const Text('Crash Report')),
          const Text('Dark Mode'),
          Consumer<DarkThemeProvider>(
            builder: (context, prov, child) {
              return Switch(
                value: prov.isDarkTheme,
                onChanged: (value) {
                  prov.isDarkTheme = value;
                },
              );
            },
          )
        ],
      ),
    );
  }
}
