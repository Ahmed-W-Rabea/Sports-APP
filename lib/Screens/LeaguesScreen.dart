import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/teamsScreen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'contriesScreen.dart';

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({super.key});

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
                      builder: (BuildContext context) =>
                          const CountriesScreen(),
                    ),
                    ModalRoute.withName('/'),
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
                  'COUNTRY NAME',
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
                  '- select the league -',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'RaceSport',
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 380, right: 20, left: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    for (int i = 0; i < 20; i++) ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 225, 154, 55),
                                Color.fromARGB(255, 207, 156, 84),
                              ],
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      TeamsScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${i + 1} -',
                                  style: const TextStyle(shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ], fontSize: 10, fontFamily: 'RaceSport'),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 45,
                                  child: Image.asset(
                                    'assets/images/foot_ball.jpg',
                                  ),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                const Text(
                                  'league name',
                                  style: TextStyle(shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ], fontSize: 10, fontFamily: 'RaceSport'),
                                ),
                                const Spacer(
                                  flex: 8,
                                ),
                                const Text(
                                  'text',
                                  style: TextStyle(shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ], fontSize: 10, fontFamily: 'RaceSport'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}