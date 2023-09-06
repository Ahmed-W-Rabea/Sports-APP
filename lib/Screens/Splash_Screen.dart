import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/onboarding.dart';
import 'package:flutter_application_1/share/local/cache/cache_helper.dart';

import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  State<SplashScreen> createState2() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1900));
    _animationController.forward();
    // _navigatedtohome();

    super.initState();
    _checkOnboardingStatus();
  }

  @override
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
    bool isOnBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;

    if (!isOnBoarding) {
      await Future.delayed(const Duration(milliseconds: 2400), () {});
      // If onboarding has been seen before, navigate to the main screen or home screen.
      if (mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Onbording(),
        ));
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 2400), () {});
      // If onboarding has not been seen, navigate to the onboarding screen.
      if (mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      }

      // Set the flag to true to indicate that onboarding has been seen.
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
              Image.asset("assets/images/logo.png"),
              const Text(
                "Sport Pulse",
                style: TextStyle(
                    fontFamily: "MxRegular", color: Colors.white, fontSize: 30),
              ),
            ]),
          )),
    );
  }
}
