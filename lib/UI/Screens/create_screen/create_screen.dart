import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController durationController = TextEditingController();
    TextEditingController personController = TextEditingController();
    TextEditingController ingredientsController = TextEditingController();
    TextEditingController instructionsController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.pinkAccent.withOpacity(0.06),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Center(
                child: Container(
                  child: Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.pink,
                  ),
                  height: 35.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.pink)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Enter recipe name...',
                      suffixIcon: Icon(Icons.edit, color: Colors.pink),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
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
                    FirebaseFirestore.instance.collection('recipe').doc().set({
                      'name':nameController.text.trim(),
                      'time':durationController.text.trim(),
                      'person':personController.text.trim(),
                      'ingredients':ingredientsController.text.trim(),
                      'instructions':instructionsController.text.trim(),
                      'category':categoryController.text.trim(),
                      'image':'',
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
    );
  }
}
