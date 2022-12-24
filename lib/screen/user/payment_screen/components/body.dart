import 'package:flutter/material.dart';
import 'package:mcode/components/default_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String groupvalue = "active";
  @override
  Widget build(BuildContext context) {
    List payment = [
      ["Bkash", "assets/images/paypal.png"],
      ["Master Card", "assets/images/visa.png"],
      ["Paypal", "assets/images/paypal.png"],
      ["Google Pay", "assets/images/paypal.png"],
    ];
    return Column(
      children: [
        Expanded(
            flex: 7,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: payment.length,
                itemBuilder: (context, index) => paymentCard(
                    text: payment[index][0],
                    icon: payment[index][1],
                    value: payment[index][0]),
              ),
            )),
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10 ),
                  child: RichText(
                    text: const TextSpan(
                        text: "Tota:\n",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                        children: [
                          TextSpan(
                              text: "৳1025.0",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                        ]),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DefaultButton(text: "PayNow", press: () {}),
                ),
                const Spacer(),
              ],
            ))
      ],
    );
  }

  paymentCard({
    required String text,
    required String icon,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: RadioListTile(
        activeColor: Colors.deepOrange,
        title: Text(
          text,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        controlAffinity: ListTileControlAffinity.trailing,
        secondary: Image.asset(
          icon,
          width: 40,
        ),
        value: value,
        groupValue: groupvalue,
        onChanged: (value) {
          setState(() {
            groupvalue = value.toString();
          });
        },
      ),
    );
  }
}
// Padding(
// padding: const EdgeInsets.all(15.0),
// child: Container(
// height: 400,
// width: double.infinity,
// child: Column(
// children: [
// ...List.generate(payment.length,
// (index) => paymentCard(
// text: text, icon: icon, value: value)),
//
//
// paymentCard(text: "Bkash", icon: Icon(Icons.add), value: "active"),
//
// paymentCard(text: "Master Card", icon: Icon(Icons.add), value: "active1"),
//
// paymentCard(text: "Paypal", icon: Icon(Icons.add), value: "active2"),
//
// paymentCard(text: "Google Pay", icon: Icon(Icons.add), value: "active3"),
// SizedBox(
// height: 30,
// ),
// ],
// ),
// ),
// ),
// SizedBox(
// height: 20,
// ),
// Container(
// width: double.infinity,
// color: Colors.black12,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Text("Total"),
// Text("৳ 1270.0",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
// Padding(
// padding: const EdgeInsets.all(20),
// child: Container(
// height: 40,
// width: double.infinity,
// decoration: BoxDecoration(
// color: Colors.deepOrange,
// borderRadius: BorderRadius.all(Radius.circular(20))),
// child: Center(child: Text("PAY NOW",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
// ),
// ),
//
// ],
// ),
// ),
