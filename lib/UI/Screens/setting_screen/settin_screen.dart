import 'dart:ui';

import 'package:cook_together/UI/Screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettinScreen extends StatefulWidget {
  const SettinScreen({super.key});

  @override
  State<SettinScreen> createState() => _SettinScreenState();
}

class _SettinScreenState extends State<SettinScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.pinkAccent.withOpacity(0.06),
        appBar: AppBar(
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProfileScreen() ,));
                },
                child: Icon(Icons.settings)),
            SizedBox(width: 2.h,)
          ],
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 0.350.dp,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 25.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.09),
                    border: Border.all(color: Colors.pink)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile...png'),
                        radius: 70,
                        child: Padding(
                          padding: EdgeInsets.only(left: 17.h),
                          child: Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h, right: 80.w),
                child: Text(
                  'Full Name',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 0.235.dp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h,right:  20.h),
                child: Container(
                  height: 5.h,
                  width: 50.w,
                  child: Padding(
                    padding:  EdgeInsets.only(left: 4.h,top: 1.h),
                    child: Text('Minha',style: TextStyle(fontSize: 0.280.dp , ),),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.09),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.pink),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h, right: 32.h),
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 0.250.dp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:1.h , right: 20.h),
                child: Container(
                  height: 5.h,
                  width: 50.w,
                  child: Padding(
                    padding:  EdgeInsets.only(left: 4.h,top: 1.h),
                    child: Text('03302727714',style: TextStyle(fontSize: 0.280.dp),),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.09),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.pink),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h, right: 40.h),
                child: Text(
                  'Eamil',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 0.250.dp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, right: 20.h),
                child: Container(
                  height: 5.h,
                  width: 50.w,
                  child: Padding(
                    padding:  EdgeInsets.only(left: 1.h,top: 1.h),
                    child: Text('abc169@gamil.com',style: TextStyle( fontSize: 0.250.dp),),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.09),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.pink),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 2.h, right: 32.h),
              //   // child: Text(
              //   //   'Date of Birth',
              //   //   style: TextStyle(
              //   //       fontWeight: FontWeight.w700,
              //   //       fontSize: 0.250.dp,
              //   //       fontStyle: FontStyle.italic),
              //   // ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 1.h, right: 20.h),
              //   child: Container(
              //     height: 5.h,
              //     width: 50.w,
              //     child: Padding(
              //       padding:  EdgeInsets.only(left: 1.h,top: 1.h),
              //       child: Text('04/06/2001',style: TextStyle(fontSize: 0.250.dp),),
              //     ),
              //     decoration: BoxDecoration(
              //       color: Colors.pinkAccent.withOpacity(0.09),
              //       borderRadius: BorderRadius.circular(15),
              //       border: Border.all(color: Colors.pink),
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                child: Container(
                  height: 8.h,
                  child: Center(
                      child: Text(
                    'Update Profile',
                    style: TextStyle(
                        fontSize: 0.290.dp,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.09),
                    border: Border.all(color: Colors.pink),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
