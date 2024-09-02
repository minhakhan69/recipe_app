import 'package:flutter/material.dart';

class SettinScreen extends StatefulWidget {
  const SettinScreen({super.key});

  @override
  State<SettinScreen> createState() => _SettinScreenState();
}

class _SettinScreenState extends State<SettinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
        Container(
        height: 200,
        width: 500,
        decoration: BoxDecoration(color: Colors.pinkAccent.withOpacity(0.09),border: Border.all(color: Colors.pink)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile...png'),
                radius: 70,
                child: Padding(
                  padding: EdgeInsets.only(left: 125),
                  child: Icon(Icons.edit),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 15, right: 280),
        child: Text(
          'Full Name',
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10, right: 70),
        child: Container(
          height: 45,
          width: 250,

          decoration: BoxDecoration(
              color: Colors.pinkAccent.withOpacity(0.09),
              borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.pink),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 15, right: 240),
        child: Text(
          'Phone Number',
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10, right: 70),
        child: Container(
          height: 45,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.pinkAccent.withOpacity(0.09),
              borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.pink),

          ),),


      ),
      Padding(
        padding: EdgeInsets.only(top: 15, right: 310),
        child: Text(
          'Eamil',
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10, right: 70),
        child: Container(height: 45,
          width: 250,

          decoration: BoxDecoration(color: Colors.pinkAccent.withOpacity(0.09),
              borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.pink),),),
      ),
      Padding(
        padding: EdgeInsets.only(top: 15, right: 280),
        child: Text(
          'Date of Birth',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontStyle: FontStyle.italic),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(top: 10, right: 70),
          child: Container(height: 45, width: 250,
              decoration: BoxDecoration(color: Colors.pinkAccent.withOpacity(
              0.09),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.pink),

      ),),)
    ,
    ]
    ,
    )
    ,
    );
  }
}
