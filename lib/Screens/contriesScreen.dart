import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'HomeScreen.dart';
import 'LeaguesScreen.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: const Color.fromARGB(255, 237, 179, 97),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 85),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    height: 180,
                    width: 180,
                    child: Image.asset('assets/images/logo2.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 285),
              child: Align(
                alignment: Alignment.topCenter,
                child: GradientText(
                  'COUNTRIES',
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'MxRegular',
                      color: Colors.white),
                  colors: const [
                    Color.fromARGB(255, 221, 156, 64),
                    Color.fromARGB(255, 254, 217, 164),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 345),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '- select the country -',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'RaceSport',
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 370, left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 5 / 4,
                crossAxisSpacing: 17,
                mainAxisSpacing: 17,
                children: [
                  for (int i = 0; i < 21; i++)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const LeaguesScreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 221, 156, 64),
                              Color.fromARGB(255, 254, 217, 164),
                            ],
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  'assets/images/foot_ball.jpg',
                                ),
                              ),
                              const Text(
                                'flag name',
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        offset: Offset(1.0, 1.0),
                                      ),
                                    ],
                                    fontSize: 10,
                                    fontFamily: 'RaceSport',
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
