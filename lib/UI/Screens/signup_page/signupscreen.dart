import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_together/UI/Screens/login_page/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  SignUpUser(String userEmail, String userPassword) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .set({
        'userEmail': userEmail,
        'create At': DateTime.now(),
        'userId': currentUser!.uid,
      }).then((value) => {
                FirebaseAuth.instance.signOut(),
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => Loginscreen()))
              });
    } on FirebaseAuthException catch (e) {
      print("error $e");
    }
  }

  List<String> button = ['false', 'true', 'other'];
  bool? isChoose = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: Text(
                    'Continue With',
                    style: TextStyle(
                        fontSize: 0.350.dp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 3.w,
                  ),
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
                        padding: EdgeInsets.only(top: 0.1.h),
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
                  padding: EdgeInsets.only(top: 0.1.h),
                  child: Column(
                    children: [
                      Text(
                        'Or',
                        style: TextStyle(
                            fontSize: 0.285.dp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Create your account',
                          style: TextStyle(
                              fontSize: 0.315.dp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
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
                          controller: emailController,
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
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Enter a password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
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
                              fontSize: 0.300.dp,
                              color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim())
                              .then((value) => {
                                    SignUpUser(
                                      emailController.text.trim(),
                                      passwordController.text.trim(),
                                    ),
                                  });
                        },
                        child: Container(
                          height: 6.h,
                          width: 50.w,
                          child: Center(
                              child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 0.315.dp,
                                color: Colors.white),
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
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.h, top: 1.h),
                                child: Text(
                                  'already have an account ?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 0.250.dp),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Loginscreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 0.280.dp,
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
