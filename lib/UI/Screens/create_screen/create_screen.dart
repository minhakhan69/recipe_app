import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: Container(
                  child: Icon(Icons.camera_alt,size: 50,color: Colors.pink,),
                  height: 210,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      border: Border.all(color: Colors.pink)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter recipe name...',
                      suffixIcon: Icon(Icons.edit,color: Colors.pink),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter time duration...',
                    suffixIcon: Icon(Icons.edit,color: Colors.pink),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter no.of persons...',
                    suffixIcon: Icon(Icons.edit,color: Colors.pink),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Ingridents...',
                    suffixIcon: Icon(Icons.edit,color: Colors.pink),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter instructions...',
                    suffixIcon: Icon(Icons.edit,color: Colors.pink),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              height: 70,
              width: 150,
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
          ],
        ),
      ),
    );
  }
}
