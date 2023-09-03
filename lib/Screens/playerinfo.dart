import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
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
  "Assist:",
];
List<dynamic> data = [
  "salah",
  "3",
  "salah",
  "salah",
  "55",
  "3",
  "4",
  "5",
  "7",
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
            Image(
              image: NetworkImage(
                  'https://tse2.mm.bing.net/th?id=OIP.jp6ZzlE7irF8mmaZDk-vCwHaIU&pid=Api&P=0&h=220'),
              height: 100,
            ),
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
          Center(
            child: TextButton(
                onPressed: () async {
                  await Share.share("follow this player : salah , liverpool");
                },
                child: Text(
                  "Share",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 247, 176, 78),
                  ),
                )),
          )
        ],
      );
    },
  );
}
