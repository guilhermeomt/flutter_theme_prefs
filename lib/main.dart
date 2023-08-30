import 'package:flutter/material.dart';
import 'package:flutter_share_pref/models/theme_settings.dart';
import 'package:flutter_share_pref/pages/settings.dart';
import 'package:flutter_share_pref/pages/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeSettings()),
      ],
      child: Consumer<ThemeSettings>(
        builder: (context, value, child) {
          return value.doneLoading
              ? MaterialApp(
                  theme: value.darkTheme ? darkTheme : lightTheme,
                  title: 'Cubeninja',
                  home: const Settings(),
                )
              : SplashScreen(context: context);
        },
      ),
    );
  }
}
