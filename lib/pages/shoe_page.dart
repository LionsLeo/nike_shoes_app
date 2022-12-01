import 'package:flutter/material.dart';
import 'package:nike_shop_app/constants/colors.dart';
import 'package:nike_shop_app/models/shoes_model.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nike_shop_app/pages/cart_add.dart';
import 'package:nike_shop_app/pages/home_page.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class ShoePage extends StatefulWidget {
  final int shoeIndex;
  const ShoePage({required this.shoeIndex, super.key});

  @override
  State<ShoePage> createState() => _ShoePageState(shoeIndex: shoeIndex);
}

class _ShoePageState extends State<ShoePage> {
  List<String> sizes = ["UK6", "UK7", "UK8", "UK9"];
  List<Color> color = [nShoeOne, nShoeTwo];
  int shoeIndex;
  bool bookmark = false, isFinished = false;
  int _currentSize = 0, _currentColor = 0;
  _ShoePageState({required this.shoeIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nBgColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: nBgColor,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 36,
                    height: 34,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: nHighlightColor)),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Text(
                  shoesData[shoeIndex].name,
                  style: const TextStyle(
                      color: nDarkColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
                Container(
                  width: 36,
                  height: 34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: nHighlightColor)),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icons/cart.png'))),
                  ),
                ),
              ],
            ),
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/nike.png'))),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 160),
            child: Hero(
              tag: shoesData[shoeIndex].image,
              child: Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: -0.349066,
                  child: Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(shoesData[shoeIndex].image),
                              fit: BoxFit.cover))),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 40),
              child: Text(
                'Size',
                style: TextStyle(
                    color: nDarkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Container(
                width: 54,
                height: 250,
                child: ListView.builder(
                    itemCount: sizes.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentSize = index;
                            });
                          },
                          child: Container(
                            width: 54,
                            height: 36,
                            decoration: BoxDecoration(
                                color: _currentSize == index
                                    ? nDarkColor
                                    : nBgColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: _currentSize == index
                                        ? nBgColor
                                        : nHighlightColor)),
                            child: Center(
                                child: Text(
                              sizes[index],
                              style: TextStyle(
                                  color: _currentSize == index
                                      ? nBgColor
                                      : nDarkColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      );
                    })),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 200),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "\$" + shoesData[shoeIndex].price,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    )
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 40),
              child: Text(
                'Fav',
                style: TextStyle(
                    color: nDarkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 60, right: 20),
              child: GestureDetector(
                onTap: (() {
                  setState(() {
                    if (bookmark == false) {
                      bookmark = true;
                    } else {
                      bookmark = false;
                    }
                  });
                }),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: bookmark == true ? nDarkColor : nBgColor,
                      border: Border.all(color: nDarkColor)),
                  child: Center(
                    child: Icon(
                      Icons.bookmark_outline,
                      size: 18,
                      color: bookmark == true ? nBgColor : nDarkColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 32,
                      height: 70,
                      child: ListView.builder(
                          itemCount: 2,
                          scrollDirection: Axis.vertical,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _currentColor = index;
                                  });
                                },
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: _currentColor == index
                                              ? nDarkColor
                                              : nHighlightColor),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                      child: Container(
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: color[index],
                                    ),
                                  )),
                                ),
                              ),
                            );
                          })),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Colour',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    )
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 250,
              height: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/box.png'), fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 55),
              child: Container(
                width: 250,
                height: 125,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Swipe to add',
                        style: TextStyle(
                            color: nDarkColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 15, left: 40, right: 40),
                        child: SwipeableButtonView(
                            buttonText: '',
                            buttonWidget: Container(
                                child: Image(
                              image: AssetImage('assets/icons/cart.png'),
                            )),
                            activeColor: nDarkColor,
                            isFinished: isFinished,
                            buttonColor: nBgColor,
                            onWaitingProcess: () {
                              Future.delayed(Duration(seconds: 1), () {
                                setState(() {
                                  isFinished = true;
                                });
                              });
                            },
                            onFinish: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()),
                              );
                              setState(() {
                                isFinished = false;
                              });
                            }),
                      )
                    ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class SwipeButton extends StatelessWidget {
  const SwipeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 92,
      decoration: BoxDecoration(
          color: nDarkColor, borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/cart_white.png'))),
              ),
              Icon(
                Icons.arrow_drop_down_sharp,
                color: nBgColor,
                size: 24,
              ),
            ]),
      ),
    );
  }
}
