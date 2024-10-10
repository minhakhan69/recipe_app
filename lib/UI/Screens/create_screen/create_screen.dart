import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateScreen extends StatefulWidget {
  String picId;

  CreateScreen({required this.picId, super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  var imageId = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController durationController = TextEditingController();
    TextEditingController personController = TextEditingController();
    TextEditingController ingredientsController = TextEditingController();
    TextEditingController instructionsController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.pinkAccent.withOpacity(0.06),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              addPic(),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Enter recipe name...',
                      suffixIcon: Icon(Icons.edit, color: Colors.pink),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: durationController,
                  decoration: InputDecoration(
                      hintText: 'Enter time duration...',
                      suffixIcon: Icon(Icons.edit, color: Colors.pink),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: personController,
                  decoration: InputDecoration(
                      hintText: 'Enter no.of persons...',
                      suffixIcon: Icon(Icons.edit, color: Colors.pink),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: ingredientsController,
                  decoration: InputDecoration(
                      hintText: 'Enter Ingredients...',
                      suffixIcon: Icon(Icons.edit, color: Colors.pink),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: instructionsController,
                  decoration: InputDecoration(
                      hintText: 'Enter instructions...',
                      suffixIcon: Icon(Icons.edit, color: Colors.pink),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                      hintText: 'Enter Category...',
                      suffixIcon: Icon(Icons.edit, color: Colors.pink),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    try {
                      FirebaseFirestore.instance
                          .collection('recipe')
                          .doc()
                          .set({
                        'name': nameController.text.trim(),
                        'time': durationController.text.trim(),
                        'person': personController.text.trim(),
                        'ingredients': ingredientsController.text.trim(),
                        'instructions': instructionsController.text.trim(),
                        'category': categoryController.text.trim(),
                        'image': imageId,
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Container(
                    height: 7.h,
                    width: 45.w,
                    child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 30,
                              color: Colors.pink),
                        )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.pink),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addPic() {
    return InkWell(
      onTap: () async {
        ImagePicker picker = ImagePicker();
        XFile? file = await picker.pickImage(source: ImageSource.gallery);
        print(file!.path);
        if (file!.path == null) return;

        String uniqueFilename =
        DateTime.now().millisecondsSinceEpoch.toString();

        Reference referenceRoot = FirebaseStorage.instance.ref();

        Reference referenceDirImages = referenceRoot.child('Recipes Images');

        Reference imageToUpload = referenceDirImages.child(uniqueFilename);

        try {
          await imageToUpload.putFile(File(file!.path));
          imageId = await imageToUpload.getDownloadURL();
          // print(imageUrl);
        } catch (e) {
          print(e);
        }
        FirebaseFirestore.instance
            .collection('recipe')
            .doc(widget.picId)
            .update({
          'image': imageId,
        }).then(
              (value) {
            print("photo uploaded succesfully");
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        child: Container(
          child: Icon(
            Icons.camera_alt,
            size: 65,
            color: Colors.pink,
          ),
          height: 20.h,
          width: 70.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.pink)),
        ),
      ),
    );
  }
}
//   void PickerFunction() async {
//     ImagePicker picker = ImagePicker();
//     XFile? file = await picker.pickImage(source: ImageSource.gallery);
//     print(file!.path);
//     if (file!.path == null) return;
//
//     String uniqueFilename = DateTime.now().millisecondsSinceEpoch.toString();
//
//     Reference referenceRoot = FirebaseStorage.instance.ref();
//
//     Reference referenceDirImages = referenceRoot.child('Profile Images');
//
//     Reference imageToUpload = referenceDirImages.child(uniqueFilename);
//
//     try {
//       await imageToUpload.putFile(File(file!.path));
//       imageUrl = await imageToUpload.getDownloadURL();
//       // print(imageUrl);
//     } catch (e) {
//       print(e);
//     }
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc()
//         .update({
//       // 'Profile_pic': imageUrl,
//     }).then(
//           (value) {
//         print("photo uploaded succesfully");
//       },
//     );
//   }
// }
