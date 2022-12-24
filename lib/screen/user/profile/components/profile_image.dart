import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mcode/constants.dart';
import 'package:mcode/screen/user/profile/components/select_photo_options_screen.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? _image;
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e){
      //print(e);
      Navigator.of(context).pop();
      //print(_image);
    }
  }
  ///Crop Image
  Future<File?>_cropImage({required File imageFile})async{
    CroppedFile? croppedImage= await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null)return null;
    return File(croppedImage.path);
  }


  void _showSelectPhotoOptions(BuildContext context) {
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
              child:  SelectPhotoOptionsScreen(onTap: _pickImage,),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
         backgroundImage: (_image == null)?const AssetImage("assets/images/No_image_found.png"):FileImage(_image!) as ImageProvider,
         radius: 60,
        child: Stack(
          children: [
            Positioned(
                bottom: -10,
                right: -10,
                child: ElevatedButton(
                  onPressed: () {
                    _showSelectPhotoOptions(context);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(kBGColor),
                      elevation: MaterialStatePropertyAll(0),
                      foregroundColor: MaterialStatePropertyAll(Colors.grey),
                      shape: MaterialStatePropertyAll(CircleBorder())),
                  child: const Icon(Icons.camera_alt_outlined),
                ))
          ],
        ),
      ),
    );
  }
}
