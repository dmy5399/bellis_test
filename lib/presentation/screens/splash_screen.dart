import 'dart:async';
import 'package:bellis_test/core/env.dart';
import 'package:bellis_test/presentation/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(const Duration(milliseconds: 1000), () async {
      prefs = await SharedPreferences.getInstance();
      Navigator.push(context, MaterialPageRoute(builder:(context) => const NewsScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}
