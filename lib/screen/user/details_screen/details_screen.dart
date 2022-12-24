import 'package:flutter/material.dart';
import 'package:mcode/components/custom_border_icon.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/model/burger_list.dart';
import 'package:mcode/model/prodact_list.dart';

import '../details_screen/components/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, this.productDataList}) : super(key: key);
  final ProductDataList? productDataList;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:CustomAppBar(),
      body: Body(productDataList: productDataList! ),
    );
  }
}
//CustomAppBar(preferredSize: const Size(0,0),child: const Center(),),

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context ){
    return AppBar(
      backgroundColor: Colors.white,
      leading:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: CustomBorderIcon(
          press: (){Navigator.pop(context);},
          icon: Icons.arrow_back_ios_new,
          color: kBGColor,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          decoration: BoxDecoration(
              color: kBGColor,
              borderRadius: BorderRadius.circular(50)
          ),
          child: Row(
            children: [
              Icon(Icons.star_border,color: Colors.yellow[800],),
              const Text("4.5",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blueGrey),),
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 55);
}

