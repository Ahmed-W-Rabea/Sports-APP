import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/onboardinmodel.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int _currentPage = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < contents.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoarding', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 27, 25, 25),
              Color.fromARGB(255, 32, 33, 43),
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(
                      () => isLastPage = index == contents.length - 1,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        GradientText(
                          contents[index].title,
                          style: const TextStyle(
                            fontFamily: 'MX',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          colors: const [
                            Color.fromARGB(255, 221, 156, 64),
                            Color.fromARGB(255, 254, 217, 164),
                          ],
                        ),
                        Image.asset(contents[index].image,
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.5),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            contents[index].discription,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'race-sport',
                              height: 2,
                              fontSize: 15,
                              color: Color.fromARGB(255, 247, 227, 199),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              Container(
                child: Center(
                  child: SmoothPageIndicator(
                      controller: _controller,
                      count: contents.length,
                      effect: const WormEffect(
                        spacing: 16,
                        dotHeight: 15,
                        dotWidth: 15,
                        dotColor: Color.fromARGB(255, 27, 25, 25),
                        activeDotColor: Color.fromARGB(255, 247, 227, 199),
                      ),
                      onDotClicked: (index) => _controller.animateToPage(index,
                          duration: const Duration(microseconds: 300),
                          curve: Curves.easeIn)),
                ),
              ),
              Container(
                  height: 60,
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: isLastPage
                      ? TextButton(
                          onPressed: () {
                            _storeOnboardInfo();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homescreen()));
                            /* Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => const Home(),
                              ),
                            );*/
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GradientText(
                                "Start",
                                style: const TextStyle(
                                    fontFamily: 'race-sport', fontSize: 20),
                                colors: const [
                                  Color.fromARGB(255, 221, 156, 64),
                                  Color.fromARGB(255, 254, 217, 164),
                                ],
                              ),
                            ],
                          ))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: GradientText(
                                "Skip",
                                style: const TextStyle(
                                    fontFamily: 'race-sport', fontSize: 20),
                                colors: const [
                                  Color.fromARGB(255, 221, 156, 64),
                                  Color.fromARGB(255, 254, 217, 164),
                                ],
                              ),
                              onPressed: () {
                                _storeOnboardInfo();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homescreen()));
                              },
                            )
                          ],
                        )),
            ]),
          ),
        ),
      ),
    );
  }
}
