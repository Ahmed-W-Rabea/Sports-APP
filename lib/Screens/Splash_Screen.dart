import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/HomeScreen.dart';
import 'package:flutter_application_1/Screens/onboarding.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  State<SplashScreen> createState2() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1900));
    _animationController.forward();
    // _navigatedtohome();

    super.initState();
    _checkOnboardingStatus();
  }

  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  // _navigatedtohome() async {
  //   await Future.delayed(Duration(milliseconds: 2400), () {});
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => Homescreen()));
  // }

  _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    if (hasSeenOnboarding) {
      await Future.delayed(Duration(milliseconds: 2400), () {});
      // If onboarding has been seen before, navigate to the main screen or home screen.
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Onbording(),
      ));
    } else {
      await Future.delayed(Duration(milliseconds: 2400), () {});
      // If onboarding has not been seen, navigate to the onboarding screen.
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Homescreen(),
      ));

      // Set the flag to true to indicate that onboarding has been seen.
      prefs.setBool('hasSeenOnboarding', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    late Animation<double> fadeAnimator =
        CurvedAnimation(parent: _animationController, curve: Curves.decelerate);
    MainAxisAlignment.center;
    CrossAxisAlignment.center;
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 27, 25, 25),
                Color.fromARGB(255, 32, 33, 43),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: FadeTransition(
            opacity: fadeAnimator,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Image.asset("assets/images/eagle.png"),
              Text(
                "SPORTIANO",
                style: TextStyle(
                    fontFamily: "mx", color: Colors.white, fontSize: 30),
              ),
            ]),
          )),
    );
  }
}
