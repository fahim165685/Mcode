import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mcode/components/custom_text_form_filed.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/admin/home_page/home_page.dart';
import 'package:mcode/screen/admin/login/components/background.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isVisible = true;
  bool isObscureText = true;
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Background(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: SvgPicture.asset("assets/icons/MCB_Icon.svg",height: 150,width: 150,)),

                const SizedBox(height: 50,),
                const Text("ADMIN LOGIN",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 5,),

                //Emile Field
                CustomTextFormField(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  validator: (email) {
                    final bool validEmail = kEmailValid.hasMatch(email.toString());

                    if (email!.isEmpty) {
                      return kEmailNullError;
                    } else if (validEmail == false) {
                      return kInvalidEmailError;
                    }
                    return null;
                  },
                ),
                //Password Field
                CustomTextFormField(
                  labelText: "Password",
                  obscureText: isObscureText,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      icon: (isObscureText == true)
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined,color: kPrimaryColor,)),
                  prefixIcon: const Icon(Icons.password_outlined),
                  validator: (password) {
                    if (password!.isEmpty) {
                      return kPassNullError;
                    } else if (password.length < 6) {
                      return kShortPassError;
                    } else if (password.length > 15) {
                      return 'Should Not Be More Than 15 Characters';
                    }
                    return null;
                  },
                ),
                DefaultButton(text: "LOGIN", press: (){
                  final isValidFrom = _fromKey.currentState!.validate();
                  if(isValidFrom){
                    Get.to(()=>const HomePage());
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
