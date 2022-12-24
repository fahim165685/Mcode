
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferCard extends StatefulWidget {
  const OfferCard({Key? key}) : super(key: key);

  @override
  State<OfferCard> createState() => _OfferCardState();
}
int activeIndex=0;
class _OfferCardState extends State<OfferCard> {

  int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }


  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  List offers=[
    ["Cash back.","30% cashback on pizza purchases","assets/images/pizza.png",Colors.cyan],
    ["Discount.","Barger Purchases 15% Discount.","assets/images/bergar.png",Colors.tealAccent],
    ["Free delivery.","Free delivery on Drinks orders","assets/images/drikns.png",Colors.blueAccent],
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: PageView.builder(
            controller: _pageController,
            allowImplicitScrolling: true,
            reverse: false,
            scrollDirection: Axis.horizontal,
            itemCount: offers.length,
            itemBuilder: (context, index) =>card(
              title: offers [index][0],
              sibTitle: offers [index][1],
              image: offers [index][2],
            ),
            onPageChanged:(int index,)=>setState(() => activeIndex = index),
          ),
        ),
        const SizedBox(height: 10,),
        buildIndicator(),
        const SizedBox(height: 10,),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex:activeIndex ,
    count: offers.length,
    effect: WormEffect(
        dotWidth: 15,
        dotHeight: 10,
        activeDotColor: kPrimaryColor,
        dotColor: kPrimaryColor.withOpacity(0.2)),
  );

  Container card({required String title,required String sibTitle,required String image}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      width: Get.width,
      height: 50,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image,),alignment: Alignment.centerRight,fit: BoxFit.fitWidth,opacity: 0.3),
          color: Colors.tealAccent,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: const TextStyle(color: Colors.black,fontSize: 28)),
          const Spacer(),
          Text(sibTitle,style: const TextStyle(color: Colors.black,fontSize: 18))
        ],
      ),
    );
  }
}