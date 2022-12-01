import 'package:flutter/material.dart';
import 'package:nike_shop_app/constants/colors.dart';
import 'package:nike_shop_app/models/shoes_model.dart';
import 'package:nike_shop_app/pages/shoe_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ["All", "Running", "Sneakers", "Formal", "Casual"];

  int _current = 0, _currentSlide = 0;

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
                              image: AssetImage('assets/icons/hamburger.png'))),
                    )),
                Image.asset(
                  'assets/logo.png',
                  width: 70,
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
                    )),
              ],
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 225,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        _currentSlide = index;
                      });
                    },
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(alignment: Alignment.center, children: <
                            Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: nSecondaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text('20%',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w800)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 3),
                                          child: Text('Discount',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text('on your first purchase',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: 96,
                                      height: 29,
                                      decoration: BoxDecoration(
                                          color: nDarkColor,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: const Center(
                                          child: Text(
                                        'Shop Now',
                                        style: TextStyle(
                                            color: nBgColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    )
                                  ]),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Container(
                                width: 250,
                                height: 250,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image:
                                            AssetImage('assets/shoes/1.png'))),
                              ),
                            ),
                          )
                        ]),
                      );
                    })),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 10),
                      child: SizedBox(
                          width: 100,
                          height: 8,
                          child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 7.5, right: 7.5),
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: _currentSlide == index
                                            ? nDarkColor
                                            : nDarkColor.withOpacity(0.3)),
                                  ),
                                );
                              })))),
                )
              ],
            ),
          ),
          Container(
              width: double.infinity,
              height: 45,
              padding: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _current = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(microseconds: 300),
                      height: 36,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: _current == index ? nDarkColor : null,
                      ),
                      margin: const EdgeInsets.all(7),
                      child: Center(
                        child: Text(
                          items[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color:
                                  _current == index ? nBgColor : nHighlightText,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                }),
              )),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              height: 375,
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 160 / 237),
                  itemCount: shoesData.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 8, bottom: 15, right: 8),
                      child: Container(
                        width: 160,
                        height: 237,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: nSecondaryColor,
                        ),
                        child: Column(children: <Widget>[
                          Hero(
                            tag: shoesData[index].image,
                            child: Container(
                              width: 140,
                              height: 165,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(shoesData[index].image),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 90,
                                        child: Text(
                                          shoesData[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: nDarkColor,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      Text("\$${shoesData[index].price}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: nDarkColor,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShoePage(
                                                  shoeIndex: index,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          color: nBgColor,
                                          border: Border.all(
                                              color: nHighlightColor),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: const Icon(
                                        Icons.arrow_forward,
                                        size: 15,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    );
                  })),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child: SizedBox(
            width: double.infinity,
            height: 80,
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icons/home.png'))),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: nDarkColor,
                        boxShadow: [
                          BoxShadow(
                            color: nDarkColor.withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 1,
                            offset: Offset(
                              0,
                              15,
                            ),
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.search,
                        color: nBgColor,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icons/profile.png'))),
                    ),
                  ]),
            ),
          )),
    );
  }
}
