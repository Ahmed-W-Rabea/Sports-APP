import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class loginscreen extends StatefulWidget {
  loginscreen({super.key});

  @override
  loginscreenState createState() => loginscreenState();
}

class loginscreenState extends State<loginscreen> {
  String _name = '';
  String _email = '';
  String _num = '';

  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool? isschecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Log in'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 27, 25, 25),
                  Color.fromARGB(255, 32, 33, 43),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 27, 25, 25),
                      Color.fromARGB(255, 32, 33, 43),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100, left: 20),
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    if (value.substring(0, 1).toUpperCase() !=
                        value.substring(0, 1)) {
                      return 'Name must begin with an uppercase letter';
                    }
                    if (value.length < 8) {
                      return 'Name must contain 8 letters or more';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    labelStyle: TextStyle(
                        color: Colors
                            .amber), // Change the label color              hintText: 'Enter your User Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.amber,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber,
                          width: 200,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(60))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 180, left: 20),
              child: SizedBox(
                width: 320,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password cannot be empty';
                    } else if (value.length < 9) {
                      return 'password must contain 9 letters or more';
                    } else if (RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return null;
                    }
                    return 'wrong way to write password';
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.amber,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Colors.amber,
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors
                            .amber), // Change the label color  hintText: 'Enter your Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber,
                          width: 200,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(60))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 245.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forget Password ?',
                        style: TextStyle(color: Colors.amber, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 320, left: 100),
              child: SizedBox(
                width: 170,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));

                    /*  if (_formKey.currentState!.validate()) {                      Navigator.push(context,MaterialPageRoute (                        builder: (BuildContext context) =>  categoryscreen(),                      ),                      );                    }                                                */
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400, left: 100),
              child: Text(
                'Other options for logging in',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ));
  }
}
