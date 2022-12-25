import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      appBar:AppBar(
        leading: CustomBorderIcon(press: (){Get.back();},),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
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
      ),
      body: Body(productDataList: productDataList! ),
    );
  }
}

