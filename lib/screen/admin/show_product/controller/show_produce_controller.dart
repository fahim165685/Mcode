import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ShowProductController extends GetxController {
  var productLengthList = [].obs;
  var productDataList =[].obs;

  final item = ['burger', 'pizza', 'seeFish', 'chicken', 'kacchi', 'beef', 'drinks',];

  @override
  void onInit() {
    productLengthData();
    super.onInit();
  }

  Future<void> productLengthData() async {
    productLengthList.clear();
    try {
      for (var items in item) {
        QuerySnapshot data = await FirebaseFirestore.instance.collection(items).get();
        var res = data.docs.length;
        print("<<<<<<<<<<<<<<<<<<<<<open:Loop>>>>>>>>>>>>>>>>>>>>>");
        productLengthList.add(res);
        print(productLengthList.length);
        print(productLengthList);
      }
    } catch (error) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          "Product Length Data Error",
          "Error is: $error");
    }
  }

}
