import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Teams extends StatelessWidget {
  const Teams({super.key});

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
              padding: EdgeInsets.only(top: 30),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 221, 156, 64),
                      )),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: ' Search..',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 97),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    height: 180,
                    width: 180,
                    child: Image.asset('assets/images/league logo.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 295),
              child: Align(
                alignment: Alignment.topCenter,
                child: GradientText(
                  'LEAGUE NAME',
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
              padding: EdgeInsets.only(top: 360),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '- league\'s  teams -',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'RaceSport',
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400, left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 5 / 4,
                crossAxisSpacing: 17,
                mainAxisSpacing: 17,
                children: [
                  for (int i = 0; i < 20; i++)
                    InkWell(
                      onTap: () {},
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
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  'assets/images/foot_ball.jpg',
                                ),
                              ),
                              const Text(
                                'team name',
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
