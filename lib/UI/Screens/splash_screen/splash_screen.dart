import 'package:cook_together/UI/Screens/login_page/loginscreen.dart';
import 'package:cook_together/core/constants/const_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pinkAccent.withOpacity(0.6),
        body: Padding(
          padding:  EdgeInsets.only(left: 5.w,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'lets Cooking',
                  style: TextStyle(
                      fontSize: 0.445.dp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,fontStyle: FontStyle.italic),
                ),
              ),
              Image.asset('assets/images/logo.png', height: 25.h),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' Cook it',
                  style: TextStyle(
                      fontSize: 0.445.dp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Eat it',
                  style: TextStyle(
                      fontSize: 0.435.dp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,fontStyle: FontStyle.italic,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginscreen()),
                    );
                  },
                  child: Container(
                    height: 10.h,
                    width: 100.w,
                    child: Center(
                      child: Text(
                        'get lovest recipies',
                        style: TextStyle(color: Colors.white, fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(34)),
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
