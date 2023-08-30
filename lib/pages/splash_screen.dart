import 'package:flutter/material.dart';
import 'package:flutter_share_pref/models/theme_settings.dart';
import 'package:provider/provider.dart';

import 'settings.dart';

class SplashScreen extends StatefulWidget {
  final BuildContext context;

  const SplashScreen({super.key, required this.context});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await Future.delayed(const Duration(seconds: 2));
    widget.context.read<ThemeSettings>().doneLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(height: 20),
              const Text(
                'Wait a second, we are throwing some shuri-ken...',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
