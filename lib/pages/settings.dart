import 'package:flutter/material.dart';
import 'package:flutter_share_pref/models/theme_settings.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Column(
          children: [
            Card(
              child: Consumer<ThemeSettings>(
                builder: (context, value, child) {
                  return ListTile(
                    title: const Text('Dark Theme'),
                    trailing: Switch(
                      value: value.darkTheme,
                      onChanged: (_) {
                        value.toggleTheme();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
