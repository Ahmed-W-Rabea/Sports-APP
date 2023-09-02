import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

List name = [
  "Name:",
  "Number:",
  "Country:",
  "Position:",
  "Age:",
  "Yellow cards num:",
  "Red cards num:",
  "Goals:",
  "Assits:",
];
List data = [
  "salah",
  "salah",
  "salah",
  "salah",
  "salah",
  "salah",
  "salah",
  "salah",
  "salah",
];

Future showdialog2(int index, context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        backgroundColor: const Color.fromARGB(255, 27, 25, 25),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "player's Info",
              style: TextStyle(
                  fontFamily: 'MX', color: Colors.white, fontSize: 22),
            ),
          ),
        ),
        content: Column(
          children: [
            Image.asset("asset/logo2.png"),
            for (int i = 0; i < 9; i++)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GradientText(
                      name[i],
                      style: const TextStyle(
                          fontFamily: 'RaceSport', fontSize: 12),
                      colors: const [
                        Color.fromARGB(255, 221, 156, 64),
                        Color.fromARGB(255, 254, 217, 164),
                      ],
                    ),
                  ),
                  Text(
                    data[i],
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Center(
              child: TextButton(
                child: const Text(
                  'Okay',
                  style: TextStyle(
                    fontSize: 16,
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
