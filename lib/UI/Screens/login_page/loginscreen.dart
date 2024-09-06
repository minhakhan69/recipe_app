import 'dart:ffi';

import 'package:cook_together/UI/Screens/home_screen/home_screen.dart';
import 'package:cook_together/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Nav_barscreen/bottomNavigationBar.dart';
import '../signup_page/signupscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  List<String> button = ['false', 'true', 'other'];
  bool? isChoose = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 9.h),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/logo.png', height: 15.h),
                SizedBox(height: 3.h),
                Text(
                  'Continue With',
                  style: TextStyle(
                      fontSize: 0.350.dp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding:  EdgeInsets.only(
                    left: 3.w,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0.1.h),
                        child: Container(
                          height: 8.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/Facebook.png',
                                    height: 28.h),
                                Text(
                                  'Facebook',
                                  style: TextStyle(
                                      fontSize: 0.285.dp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 0.1.h),
                        child: Container(
                          height: 8.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  'assets/images/Google.png',
                                  height: 25.h,
                                ),
                                Text(
                                  'Google',
                                  style: TextStyle(
                                      fontSize: 0.285.dp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 0.1.h),
                  child: Column(
                    children: [
                      Text(
                        'Or',
                        style: TextStyle(
                            fontSize: 0.285.dp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        'Login to your account',
                        style: TextStyle(
                            fontSize: 0.315.dp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 80.w),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 0.250.dp),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your Email id',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 72.w),
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 0.250.dp,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter a password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.h),
                        child: Text('forgot password ?'),
                      ),
                      CheckboxListTile(
                        value: isChoose,
                        onChanged: (Value) {
                          setState(() {
                            isChoose = Value;
                          });
                        },
                        title: Text(
                          'Remember Me',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 0.285.dp,
                              color: Colors.black),
                        ),

                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottomnavigationbar()));
                        },
                        child: Container(
                          height: 6.h,
                          width: 50.w,
                          child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 0.315.dp,color: Colors.white),
                              )),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            border: Border.all(color: Colors.purple),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.h,top: 1.h),
                              child: Text(
                                'Dont have an account ?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 0.245.dp),
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Signupscreen()));
                            },
                            child: Padding(
                              padding:  EdgeInsets.only(top: 1.h),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 0.265.dp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
