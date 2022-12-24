import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/admin/add_product/components/add_product_form.dart';
import 'package:mcode/screen/admin/add_product/components/select_photo_options.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';


class ProductImage extends StatefulWidget {
  const ProductImage({Key? key, required this.list}) : super(key: key);

  final List<File> list;
  @override
  State<ProductImage> createState() => _ProductImageState();
}

AddProductForm addProductForm = const AddProductForm();

class _ProductImageState extends State<ProductImage> {
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source, imageQuality: 80);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        widget.list.add(img!);
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      Navigator.of(context).pop();
      return Center(child:Text(e.toString()));
    }
  }

  ///Crop Image
  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  ///ModalBottomSheet
  void showSelectPhotoOptions(BuildContext context) {
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
              child: SelectPhotoOptions(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Add product images", style: TextStyle(color: Colors.black, fontSize: 20,)),
              const SizedBox(width: 5,),
              InkWell(
                onTap: (){
                  if(widget.list.length > 3){
                     customSnackBar(
                      context: context,
                      title: "Warning".toUpperCase(),
                      massage: "You can add only 4 images in this field",
                      contentType: ContentType.warning,
                    );
                  }else{
                    showSelectPhotoOptions(context);
                  }
                },

                child: const Text("Add now>", style: TextStyle(color: kPrimaryColor, fontSize: 20,decoration: TextDecoration.underline)),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                widget.list.length,
                (index) => addImage(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (widget.list.isEmpty)
                          ? const AssetImage("assets/images/No_image_found.png")
                          : FileImage(widget.list[index]) as ImageProvider,
                    ),
                    onTap: () {
                      setState(() {
                        widget.list.removeAt(index);
                      });
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget addImage(
      {required VoidCallback onTap, required DecorationImage image}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      height: 110,
      width: 110,
      //clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.white,
          image: image,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(5, 5),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              bottom: -18,
              right: -18,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: kBGColor, width: 5)),
                  child: const Icon(
                    Icons.delete_outline,
                    color: kPrimaryColor,
                    size: 30,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
