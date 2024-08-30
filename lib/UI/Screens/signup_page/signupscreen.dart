import 'package:cook_together/UI/Screens/login_page/loginscreen.dart';
import 'package:flutter/material.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  List<String> button = ['false', 'true', 'other'];
  bool? isChoose = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/logo.png', height: 130),
                SizedBox(height: 20),
                Text(
                  'Continue With',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 50,
                          width: 120,
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
                                    height: 25),
                                Text(
                                  'Facebook',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 50,
                          width: 120,
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
                                  height: 35,
                                ),
                                Text(
                                  'Google',
                                  style: TextStyle(
                                      fontSize: 20,
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
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      Text(
                        'Or',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        'Create your account',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 300),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your Email id',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 280),
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter a password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      CheckboxListTile(
                        title: Text(
                          'Remember Me',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        value: isChoose,
                        onChanged: (Value) {
                          setState(() {
                            isChoose = Value;
                          });
                        },
                      ),
                      Container(
                        height: 44,
                        width: 240,
                        child: Center(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            )),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          border: Border.all(color: Colors.brown),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'already have an account ?',
                                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
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
