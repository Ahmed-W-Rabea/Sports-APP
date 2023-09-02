import 'package:flutter/material.dart';

class TopScorers extends StatelessWidget {
  const TopScorers({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 30, right: 33),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(children: [
                  Text(
                    '#',
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'RaceSport',
                        color: Colors.white),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'RaceSport',
                        color: Colors.white),
                  ),
                  Spacer(
                    flex: 6,
                  ),
                  Text(
                    'G',
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'RaceSport',
                        color: Colors.white),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    'GFP',
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'RaceSport',
                        color: Colors.white),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    'A',
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'RaceSport',
                        color: Colors.white),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    for (int i = 0; i < 15; i++) ...[
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
                            onPressed: () {},
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
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'player name',
                                      style: TextStyle(shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          offset: Offset(1.0, 1.0),
                                        ),
                                      ], fontSize: 10, fontFamily: 'RaceSport'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        'player team',
                                        style: TextStyle(
                                            shadows: [
                                              Shadow(
                                                color: Colors.black,
                                                offset: Offset(1.0, 1.0),
                                              ),
                                            ],
                                            fontSize: 8,
                                            fontFamily: 'RaceSport'),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(
                                  flex: 7,
                                ),
                                const Text(
                                  '2',
                                  style: TextStyle(shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ], fontSize: 10, fontFamily: 'RaceSport'),
                                ),
                                const Spacer(
                                  flex: 3,
                                ),
                                const Text(
                                  '2',
                                  style: TextStyle(shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ], fontSize: 10, fontFamily: 'RaceSport'),
                                ),
                                const Spacer(
                                  flex: 3,
                                ),
                                const Text(
                                  '2',
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
