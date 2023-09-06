import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/HomeScreen.dart';
import 'package:flutter_application_1/resources/auth_methods.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../resources/auth.dart';

class loginSceren extends StatefulWidget {
  loginSceren({super.key});

  @override
  State<loginSceren> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginSceren> {
  TextEditingController userInputController = TextEditingController();
  int randomNumber = 0;
  bool isGenerating = false;
  bool isVerifying = false;

  void verifyNumber() {
    if (isVerifying) return;
    String userNumber = userInputController.text;

    if (userNumber == randomNumber.toString() && userNumber.length == 4) {
      setState(() {
        isVerifying = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => HomeScreen(),
          ),
        );
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 27, 25, 25),
            content: const Text(
              'Verification is Wrong!',
              style: TextStyle(fontFamily: 'RaceSport', color: Colors.white),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 221, 156, 64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Try Again',
                  style: TextStyle(fontFamily: 'RaceSport'),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void generateRandomNumber() {
    final random = Random();
    final newRandomNumber = random.nextInt(9000) + 1000;
    setState(() {
      randomNumber = newRandomNumber;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 3,
          backgroundColor: const Color.fromARGB(255, 27, 25, 25),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GradientText(
                colors: const [
                  Color.fromARGB(255, 221, 156, 64),
                  Color.fromARGB(255, 254, 217, 164),
                ],
                'OTP',
                style: const TextStyle(
                    fontFamily: 'MxRegular', color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 70.0, top: 15),
            child: Text(
              ' $randomNumber',
              style: const TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'RaceSport'),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                child: TextButton(
                  child: GradientText(
                    colors: const [
                      Color.fromARGB(255, 221, 156, 64),
                      Color.fromARGB(255, 254, 217, 164),
                    ],
                    'Okay',
                    style: const TextStyle(
                      fontFamily: 'RaceSport',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 176, 78),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    AuthMethods authMethods = AuthMethods();
    Authpage authpage = Authpage();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 23, 22, 22),
          Color.fromARGB(255, 28, 28, 35),
        ]),
        elevation: 5,
        title: Padding(
          padding: EdgeInsets.only(left: 120.w, top: 4.h),
          child: Row(
            children: [
              Center(
                child: GradientText(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'MxRegular',
                    fontSize: 23.sp,
                  ),
                  colors: const [
                    Color.fromARGB(255, 221, 156, 64),
                    Color.fromARGB(255, 254, 217, 164),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 27, 25, 25),
              Color.fromARGB(255, 32, 33, 43),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: GradientText(
                ' Login With OTP',
                style: TextStyle(
                  fontFamily: 'RaceSport',
                  fontSize: 15.sp,
                ),
                colors: const [
                  Color.fromARGB(255, 221, 156, 64),
                  Color.fromARGB(255, 254, 217, 164),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: generateRandomNumber,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 221, 156, 64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'generate OTP',
                  style: TextStyle(fontFamily: 'RaceSport'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: userphoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Phone Number',
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 221, 156, 64))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(255, 221, 156, 64),
                  )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: userInputController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter OTP',
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 221, 156, 64))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromARGB(255, 221, 156, 64),
                  )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: isVerifying
                  ? null
                  : verifyNumber, // Disable during verification
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 221, 156, 64),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: isVerifying
                  ? const CircularProgressIndicator(
                      color: const Color.fromARGB(255, 221, 156, 64),
                    ) // Show CircularProgressIndicator during verification
                  : const Text(
                      'Verify',
                      style: TextStyle(fontFamily: 'RaceSport'),
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200.h, left: 60.w),
              child: Row(
                children: [
                  GradientText(
                    'Login With ',
                    style: TextStyle(
                      fontFamily: 'RaceSport',
                      fontSize: 15.sp,
                    ),
                    colors: const [
                      Color.fromARGB(255, 221, 156, 64),
                      Color.fromARGB(255, 254, 217, 164),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await AuthMethods().signInWithGoogle(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 221, 156, 64),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Center(
                          child: Text(
                            'Google',
                            style: TextStyle(fontFamily: 'RaceSport'),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ... Existing code ...
    );
  }
}

TextEditingController userphoneController = TextEditingController();
