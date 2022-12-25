import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcode/components/custom_border_icon.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/model/prodact_list.dart';
import 'package:mcode/screen/admin/show_product/controller/get_product_controller.dart';
import 'package:mcode/screen/admin/update_product/product_update_page.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key, required this.filedName})
      : super(key: key);
  final String filedName;

  @override
  Widget build(BuildContext context) {
    GetProductController controller =
        Get.put(GetProductController(filedName: filedName.toString()));

    ///ModalBottomSheet
    void showUpdateOptions(
        {required BuildContext context,
        required ProductDataList productDataList}) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.7,
            minChildSize: 0.3,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                  controller: scrollController,
                  child: ProductUpdatePage(
                    productDataList: productDataList,
                    collectionName: filedName,
                  ));
            }),
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: CustomBorderIcon(
            press: () {
              Get.back();
            },
          ),
          title: Text(filedName.toUpperCase()),
        ),
        body: Obx(()=>  GridView.builder(
          itemCount: controller.getData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 5 / 7),
          itemBuilder: (context, index) {
            //ProductDataList productDataList = controller.productDataList[index];
            try {
              return itemCard(
                  context: context,
                  image: controller.getData[index].image![0],
                  price: controller.getData[index].price!,
                  name: controller.getData[index].name!,
                  onEdit: () {
                    showUpdateOptions(
                        context: context, productDataList: controller.getData[index]);
                  },
                  onDelete: () {
                    controller.deleteProduct(
                      id: controller.getData[index].id!,
                      index: index,
                    );
                  },
                  onDetails: () {
                    Get.to(() =>  Details(productDataList: controller.getData[index]),
                        duration: const Duration(seconds: 1));
                  });
            } catch (f) {
              return Image.asset("assets/images/No_image_found.png");
            }
          },
        )));
  }

  Card itemCard({
    required String image,
    required String name,
    required String price,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
    required VoidCallback onDetails,
    required BuildContext context,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15)),
              ),
              Positioned(
                  right: -12,
                  top: -12,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: onEdit,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(name,
                maxLines: 1,
                style: const TextStyle(color: Colors.black, fontSize: 24)),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text("৳ $price",
                      maxLines: 1,
                      softWrap: true,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        builder: (context) => DraggableScrollableSheet(
                            initialChildSize: 0.15,
                            maxChildSize: 0.3,
                            minChildSize: 0.15,
                            expand: false,
                            builder: (context, scrollController) {
                              return SingleChildScrollView(
                                controller: scrollController,
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        ListTile(
                                          leading:
                                              const Icon(Icons.delete_outline),
                                          title: const Text("Delete"),
                                          onTap: () async {
                                            Get.back();
                                            await Future.delayed(const Duration(
                                                milliseconds: 200));
                                            showDialog(
                                              context:  context,
                                              builder:
                                                  (BuildContext dialogContext) {
                                                return AlertDialog(
                                                  title: Row(
                                                    children: const [
                                                      Icon(Icons.warning,
                                                          color:
                                                              Colors.redAccent),
                                                      Text('Warning'),
                                                    ],
                                                  ),
                                                  content: const Text(
                                                      'Are you sure delete this item?'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text(
                                                        'not interested'
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      onPressed: () {
                                                        Get.back(); // Dismiss alert dialog
                                                      },
                                                    ),
                                                    TextButton(
                                                      onPressed: onDelete,
                                                      child: const Text(
                                                          'YES SURE'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ListTile(
                                          leading:
                                              const Icon(Icons.details_rounded),
                                          title: const Text('details'),
                                          onTap: onDetails,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    },
                    icon: const Icon(Icons.more_vert))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({Key? key, required this.productDataList}) : super(key: key);
  final ProductDataList productDataList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details".toUpperCase()),
        leading: CustomBorderIcon(
          press: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text("Images  :",style: TextStyle(color: Colors.black,fontSize: 20 )),
              const SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(productDataList.image!.length,
                            (index) =>SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                elevation: 3,
                                clipBehavior:Clip.antiAlias,
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(color: Colors.white)),
                                child: Image.network(productDataList.image![index],fit: BoxFit.cover,),
                              ),
                            )

                    )
                  ],
                ),
              ),

              _buildRow(
                name: "Name",
                filed: productDataList.name!
              ),
              _buildRow(
                  name: "Price",
                  filed: productDataList.price!
              ),
              _buildRow(
                  name: "Making Time",
                  filed: productDataList.makingTime!
              ),
              _buildRow(
                  name: "Delivery Time",
                  filed: productDataList.deliveryTime!
              ),
              _buildRow(
                  name: "Kilocalorie",
                  filed: productDataList.kilocalorie!
              ),
              _buildRow(
                  name: "Description",
                  filed: productDataList.description!
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow({required String name,required String filed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: Text(name,style: TextStyle(fontSize: 18),)),
                  const Expanded(flex: 1, child: Text(":")),
                  Expanded(
                      flex: 3,
                      child: Text(filed,style: const TextStyle(fontSize: 18,color: Colors.black))),
                ],
              ),
    );
  }
}
