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
  SignUpUser(String userEmail, String userPassword, String userName,
      String userPhone) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .set({
        'userEmail': userEmail,
        'userPassword': userPassword,
        'userName': userName,
        'userPhone': userPhone,
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
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png', height: 15.h),
                  SizedBox(height: 6.h),
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0.05),
                      child: Text(
                        'Create your account',
                        style: TextStyle(
                            fontSize: 0.310.dp,
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
                    Padding(
                      padding: EdgeInsets.only(right: 81.w),
                      child: Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 0.250.dp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 68.w),
                      child: Text(
                        'phone number',
                        style: TextStyle(
                            fontSize: 0.250.dp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: numberController,
                        decoration: InputDecoration(
                          hintText: 'Enter your phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
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
                            fontSize: 0.250.dp,
                            color: Colors.black),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim())
                            .then((value) {
                          SignUpUser(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              nameController.text.trim(),
                              numberController.text.trim());
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
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
