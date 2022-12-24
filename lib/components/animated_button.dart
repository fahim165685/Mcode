import 'package:flutter/material.dart';
import 'package:mcode/constants.dart';


enum ButtonState{init, loading, done,wrong}

class AnimationButton extends StatefulWidget {
  const AnimationButton({Key? key, required this.onTap, required this.text}) : super(key: key);
  final VoidCallback onTap;
  final String text;

  @override
  State<AnimationButton> createState() => _AnimationButtonState();
}

class _AnimationButtonState extends State<AnimationButton> {
  bool isAnimation =true;
  ButtonState state =ButtonState.init;
  @override
  Widget build(BuildContext context) {
    final width =MediaQuery.of(context).size.width;
    final isDone = state == ButtonState.done;
    final isStretched = isAnimation || state ==ButtonState.init;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds:500),
        curve: Curves.easeIn,
        width: state == ButtonState.init ? width:70,
          onEnd: ()=> setState(()=>isAnimation =!isAnimation),
          height: 60,
          child:isStretched? buildButton() : buildSmallButton(isDone),
      ),
    );
  }

  OutlinedButton buildButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        side: const BorderSide(width: 1.5,color: kPrimaryColor),
      ),
      child: FittedBox(
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 24,
            color: kPrimaryColor,
            letterSpacing:1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    onPressed: () async{
       setState(()=>state = ButtonState.loading);
        await Future.delayed(const Duration(seconds: 2));
        setState(()=>state = ButtonState.done);
        await Future.delayed(const Duration(seconds: 1));
        setState(()=>state = ButtonState.init);
       // await Future.delayed(const Duration(milliseconds: 500));
        setState(widget.onTap);

    },
  );

  }
  Widget buildSmallButton(bool isDone){
    final color = isDone?Colors.lightGreen:kTextColor.withOpacity(0.5);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
          child: isDone?
          const Icon(Icons.done,size: 52,color: Colors.white,):
          const CircularProgressIndicator(color: Colors.white,)),
    );
  }
}
