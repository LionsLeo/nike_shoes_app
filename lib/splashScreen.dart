import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nike_shop_app/constants/colors.dart';
import 'package:nike_shop_app/pages/home_page.dart';
import 'package:nike_shop_app/pages/shoe_page.dart';

class SplashScreenNew extends StatefulWidget {
  const SplashScreenNew({super.key});

  @override
  State<SplashScreenNew> createState() => _SplashScreenNewState();
}

class _SplashScreenNewState extends State<SplashScreenNew> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nBgColor,
      appBar: AppBar(
        backgroundColor: nBgColor,
        elevation: 0.0,
      ),
      body: Center(
          child: Container(
        margin: EdgeInsets.only(bottom: 75),
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/logo.png'))),
      )),
    );
  }
}
