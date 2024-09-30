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
       backgroundColor:Colors.white ,
        body: Padding(
          padding: EdgeInsets.only(
            left: 5.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'lets Cooking',
                    style: TextStyle(
                        fontSize: 0.445.dp,
                        fontWeight: FontWeight.w600,
                        color: Colors.brown,
                       ),
                  ),
                ),
              ),
              Image.asset('assets/images/dp.png', height: 30.h),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    ' Cook it',
                    style: TextStyle(
                        fontSize: 0.445.dp,
                        fontWeight: FontWeight.w600,
                        color: Colors.brown,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Eat it',
                    style: TextStyle(
                      fontSize: 0.435.dp,
                      fontWeight: FontWeight.w600,
                      color: Colors.brown,

                    ),
                  ),
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
                    height: 8.h,
                    width: 75.w,
                    child: Center(
                      child: Text(
                        ' lovest recipies',
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 0.360.dp,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(color: Colors.brown),
                        borderRadius: BorderRadius.circular(24)),
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
