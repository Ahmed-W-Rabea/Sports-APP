import 'package:flutter/cupertino.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomeScreennState();
}

class _HomeScreennState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    MainAxisAlignment.center;
    return Center(
      child: Text(
        "Hell0",
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
