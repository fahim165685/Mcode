import 'package:flutter/material.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/home/components/offer_card.dart';
import 'package:mcode/screen/user/home/components/search_field.dart';
import 'package:mcode/screen/user/home/pages/beef/beef.dart';
import 'package:mcode/screen/user/home/pages/burger/burger.dart';
import 'package:mcode/screen/user/home/pages/chicken/chicken.dart';
import 'package:mcode/screen/user/home/pages/drinks/drinks.dart';
import 'package:mcode/screen/user/home/pages/kachchi/kachchi.dart';
import 'package:mcode/screen/user/home/pages/pizza/pizza.dart';
import 'package:mcode/screen/user/home/pages/sea_fish/sea_fish.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const CustomTapBar();
  }
}
class CustomTapBar extends StatefulWidget {
  const CustomTapBar({Key? key}) : super(key: key);

  @override
  State<CustomTapBar> createState() => _CustomTapBarState();
}

class _CustomTapBarState extends State<CustomTapBar>with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 7, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  final List tabItem=[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: false,
              backgroundColor: kBGColor,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                     SizedBox(height: 10,),
                    Text(
                      "Fast and\nDelicious Food",
                      style: TextStyle(
                          color: kTextLiteColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 35),
                    ),
                    SearchField(),
                    SizedBox(height: 20,),
                    OfferCard(),
                    ///Search Field

                    SizedBox(height: 15,),
                  ],
                ),
              ),
              expandedHeight: 350.0,
              bottom: TabBar(
                  controller: controller,
                  isScrollable: true,
                  indicatorColor: kPrimaryColor,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  splashBorderRadius: BorderRadius.circular(20),
                  indicator: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color: kPrimaryColor
                  ),
                  tabs:const[
                    Text("Burger"),
                    Text("Beef"),
                    Text("Sea Fish"),
                    Text("Pizza"),
                    Text("Chicken"),
                    Text("Kacchi"),
                    Text("Drinks"),
                  ]

              ),
            ),
          ];
        },
        body: TabBarView(
          controller: controller,
          children:const [
            Burger(),
            Beef(),
            SeaFish(),
            Pizza(),
            Chicken(),
            Kachchi(),
            Drinks()
          ],
        ),
      ),
    );
  }
}
