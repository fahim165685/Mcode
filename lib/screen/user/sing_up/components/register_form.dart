
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/custom_text_form_filed.dart';
import 'package:mcode/components/default_button.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/otp/otp_screen.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class RegController extends GetxController {
  var isPass = false.obs;
  var isRePass = false.obs;
  var isLoading = false.obs;


  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  ///Controller
  TextEditingController emileController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void loading()=> isLoading.value=!isLoading.value;
  void pass()=> isPass.value=!isPass.value;
  void rePass()=> isRePass.value=!isRePass.value;

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<< <Register Account> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Future<void> registerAccount({required String email, required String password,BuildContext? context})async{
    loading();

    await auth.createUserWithEmailAndPassword(
    email: email,
    password:password).then((value){

       firebaseFireStore.collection("UserProfile").doc(value.user!.uid).set(
          {

            'userId': value.user!.uid.toString(),
            'createdAt':DateTime.now().toString(),
            'name':nameController.text.trim(),
            'phone':phoneController.text.trim(),
            'email':emileController.text.trim(),
            'age':'',
            'gender':'',

          });

      loading();
    customSnackBar(context: context!, contentType: ContentType.success, title: "Successful", massage: "Your Account Has Been Created Successfully");
    Get.to(()=>const OtpScreen(),duration: (const Duration(milliseconds: 500)));
    } ).onError((error, stackTrace){
      loading();
    customSnackBar(context: context!, contentType: ContentType.failure, title: "Information not valid", massage: "This Account Already Exists");
    });

  }
}

class RegisterFrom extends StatelessWidget {
  const RegisterFrom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    //Controller
    RegController controller = Get.put(RegController());
    return Obx(() =>   Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
          children: [
            //Name Filed
            CustomTextFormField(
                controller:controller.nameController,
                validator: (emile) {
                  if (emile!.isEmpty) {
                    return kEmailNullError;
                  }
                  return null;
                },
                suffixIcon: const Icon(Icons.person_outline_rounded),
                labelText: "Name"),
            //phone Filed
            CustomTextFormField(
              maxLength: 11,
                controller: controller.phoneController,
                validator: (phone) {
                  if (phone!.isEmpty) {
                    return "Enter Phone Number *";
                  } else if (phone.length < 11) {
                    return "Enter valid Phone Number";
                  }
                  return null;
                },
                suffixIcon: const Icon(Icons.phone_outlined),
                labelText: "Phone"),
            //Emile Filed
            CustomTextFormField(
                controller: controller.emileController,
                validator: (emile) {
                  bool isValid = kEmailValid.hasMatch(emile.toString());
                  if (emile!.isEmpty) {
                    return kEmailNullError;
                  } else if (isValid == false) {
                    return kInvalidEmailError;
                  }
                  return null;
                },
                suffixIcon: const Icon(Icons.email_outlined),
                labelText: "Email"),
           //Password Filed
             CustomTextFormField(
              controller: controller.passwordController,
              obscureText: controller.isPass.isTrue,
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
                 controller.pass();
                },
                icon: (controller.isPass.value == false)
                    ? const Icon(Icons.visibility_outlined, size: 29)
                    : const Icon(Icons.visibility_off_outlined, size: 29),
              ),
            ),
            //Confirm Password Filed
            CustomTextFormField(
              obscureText: controller.isRePass.isTrue,
              validator: (value) {
                if (value!.isEmpty) {
                  return kPassNullError;
                }else if(value.toString() != controller.passwordController.text ){
                  return kMatchPassError;
                }
                else if (value.length < 6) {
                  return kShortPassError;
                } else if (value.length > 15) {
                  return 'Should Not Be More Than 15 Characters';
                }
                return null;
              },
              labelText: "Confirm Password",
              suffixIcon: IconButton(
                color: Colors.grey,
                onPressed: () {
                  controller.rePass();
                },
                icon: (controller.isRePass.value == false)
                    ? const Icon(Icons.visibility_outlined, size: 29)
                    : const Icon(Icons.visibility_off_outlined, size: 29),
              ),
            ),
            const SizedBox(height: 50,),
            (controller.isLoading.value==true)? const CircularProgressIndicator(): DefaultButton(
              text: "Continue",
              press: () {
                final isValidFrom =formKey.currentState!.validate();
                if (isValidFrom) {
                  controller.registerAccount(
                    context: context,
                    email: controller.emileController.text,
                    password: controller.passwordController.text,
                  );
                }
              },
            ),
          ],
        )
    ));
  }

}
