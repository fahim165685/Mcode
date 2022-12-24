import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/custom_text_form_filed.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/sign_in/sign_in_screen.dart';

class Controllers extends GetxController {
  var isPaa = false.obs;
  var isRePass = false.obs;
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    TextEditingController passwordController = TextEditingController();

    Get.put(Controllers());
    Controllers controller = Get.find<Controllers>();

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child:Obx(() =>  Column(
        children: [
          const Spacer(flex: 1),
          Image.asset("assets/icons/MCB_Icon.png"),
          const Spacer(flex: 1),
          const Text(
            "Forgot Password",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Enter your new Password",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          CustomTextFormField(
                controller: passwordController,
                obscureText: controller.isPaa.isTrue,
                validator: (value) {
                  if (value!.isEmpty) {
                    return kPassNullError;
                  } else if (value.length < 6) {
                    return kShortPassError;
                  } else if (value.length > 15) {
                    return 'Should Not Be More Than 15 Characters';
                  }
                  return null;
                },
                labelText: "Password",
                suffixIcon: IconButton(
                  color: Colors.grey,
                  onPressed: () {
                    controller.isPaa.value = !controller.isPaa.value;
                  },
                  icon: (controller.isPaa.value == false)
                      ? const Icon(Icons.visibility_outlined, size: 29)
                      : const Icon(Icons.visibility_off_outlined, size: 29),
                ),
              ),
          CustomTextFormField(
                obscureText: controller.isRePass.isTrue,
                validator: (value) {
                  if (value!.isEmpty) {
                    return kPassNullError;
                  } else if (value.length < 6) {
                    return kShortPassError;
                  } else if (value.length > 15) {
                    return 'Should Not Be More Than 15 Characters';
                  } else if (value.toString() != passwordController.text) {
                    return kMatchPassError;
                  }
                  return null;
                },
                labelText: "Password",
                suffixIcon: IconButton(
                  color: Colors.grey,
                  onPressed: () {
                    controller.isRePass.value = !controller.isRePass.value;
                  },
                  icon: (controller.isRePass.value == false)
                      ? const Icon(Icons.visibility_outlined, size: 29)
                      : const Icon(Icons.visibility_off_outlined, size: 29),
                ),
              ),
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DefaultButton(
                text: "Submit",
                press: () {
                  final isValidFrom = formKey.currentState!.validate();
                  if (isValidFrom) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: kPrimaryColor.withOpacity(0.5),
                        content: const Text("success")));
                    Get.to(() => const SignInScreen());
                  }
                }),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ))
    );
  }
}
