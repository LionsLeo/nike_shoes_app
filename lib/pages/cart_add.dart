import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nike_shop_app/constants/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 1), () => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: nBgColor,
        elevation: 0.0,
      ),
      body: Container(
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('assets/logo.png')),
              Text(
                'Added to Cart',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 100,
              )
            ]),
      )),
    );
  }
}
