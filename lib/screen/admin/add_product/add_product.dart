import 'package:flutter/material.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/admin/add_product/components/select_product_options_screen.dart';
import 'package:mcode/screen/admin/show_product/show_product.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showAddProductList() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.28,
            maxChildSize: 0.4,
            minChildSize: 0.28,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child:  const SelectProductOptionsScreen(),
              );
            }),
      );
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){showAddProductList();},
        backgroundColor: Colors.white,
        child: const Icon(Icons.add,color: kPrimaryColor,size: 40),
      ),

     body:const ShowAllProduct(),
    );
  }
}
