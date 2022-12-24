
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 5 ),
            width: Get.width * 0.75,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 5,
                      offset: const  Offset(0,5)
                  )
                ],
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              onChanged: (value) {},
              style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 20),
              decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search, size: 30),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 9)),
            )),
        //SizedBox(width:Get.width*0.1,),
        InkWell(
          onTap: (){},
          borderRadius: BorderRadius.circular(10),
          child: Container(
            margin: const EdgeInsets.all(4),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.tune_rounded, size: 35, color: Colors.white),
          ),
        )
      ],
    );
  }
}