import 'package:flutter/material.dart';
import 'package:plantsnest/Screens/NestScreen.dart';
import 'package:plantsnest/Screens/SignupScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:plantsnest/Screens/TimelineScreen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int count = 0;
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _error;
  User _user;
  void _submit() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print(_email);
      print(_password);
      try {
        UserCredential authResult = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        setState(() {
          _user = authResult.user;
        });
      } on FirebaseException catch (e) {
        _error = e.message;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(child: showAlert()),
              SizedBox(
                height: 100,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/profilehandle.png'))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Center(
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              Text(
                'Join PlantsNest Now \n To Get Your Nests Growing ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (userInput) {
                    if (!userInput.contains('@')) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                  onSaved: (userInput) => _email = userInput,
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (String userInput) {
                    if (userInput.length < 7) {
                      return 'Password minimum 7 characters';
                    }
                    print("made it user validator");
                    _formKey.currentState.save();
                    return null;
                  },
                  onSaved: (userInput) => _password = userInput,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () async {
                    await _submit();
                    if (_user != null) {
                      Navigator.pushNamed(
                        context,
                        TimelineScreen.routeName,
                        arguments: {'user': _user},
                      );
                    }
                  },
                  child: Text("Log In"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    SignupScreen.routeName,
                  );
                },
                child: const Center(
                  child: Text(
                    'New Account ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.limeAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
                child: AutoSizeText(
              _error,
              maxLines: 4,
            )),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _error = null;
                });
              },
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }
}
