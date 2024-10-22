import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.yellow.shade700,
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.07),
                  border: Border.all(color: Colors.brown.shade900)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile...png'),
                      radius: 70,
                      child: Padding(
                        padding: EdgeInsets.only(left: 125),
                        child: Icon(Icons.edit,color: Colors.brown.shade900,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 75),
                    child: Column(
                      children: [
                        Text('Minha khan'),
                        Text('03100012345'),
                        Text('xyz102@g'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print('profile tapped');
                },
                child: Row(
                  children: [
                    Icon(Icons.person,color: Colors.yellow.shade600,),
                    Text(
                      'Profile',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.brown.shade900),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.favorite_border,color: Colors.yellow.shade600,),
                  Text(
                    'Favourite',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18,color: Colors.brown.shade900),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.lock,color: Colors.yellow.shade600,),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.brown.shade900),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.settings,color: Colors.yellow.shade600,),
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.brown.shade900),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.help,color: Colors.yellow.shade600,),
                  Text(
                    'Help',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16,color: Colors.brown.shade900),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.language,color: Colors.yellow.shade600,),
                  Text(
                    'Languages',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.brown.shade900),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.logout,color: Colors.yellow.shade600,),
                  Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16,color: Colors.brown.shade900),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
