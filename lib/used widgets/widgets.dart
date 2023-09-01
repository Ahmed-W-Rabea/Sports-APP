import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../Screens/contriesScreen.dart';

Widget container(
    {required String name,
    required String image,
    required Function() onPresed}) {
  return InkWell(
    onTap: onPresed,
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: GradientText(
              name,
              style: TextStyle(fontFamily: 'MxRegular', fontSize: 14.sp),
              colors: const [
                Color.fromARGB(255, 221, 156, 64),
                Color.fromARGB(255, 254, 217, 164),
              ],
            )),
      ),
    ),
  );
}

Future showdialog(int index, context) async {
  return index == 0
      ? Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const CountriesScreen(),
          ),
        )
      : showDialog(
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
                    'COMING SOON',
                    style: TextStyle(
                        fontFamily: 'MxRegular',
                        color: Colors.white,
                        fontSize: 22),
                  ),
                ),
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
