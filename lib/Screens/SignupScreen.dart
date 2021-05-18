import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/sign-up';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email, _password, _name, _error;
  User _user;

  void _submit() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print(_email);
      print(_password);
      try {
        final UserCredential authResult = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        setState(() {
          _user = authResult.user;
        });
        //push new route with context
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          print('Weak Password');
          setState(() {
            _error = 'Weak Password';
          });
        } else if (e.code == 'email-already-in-use') {
          setState(() {
            _error = 'Email linked to existing account';
          });
        }
      } catch (e) {
        setState(() {
          e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Account Free'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'First Last Name'),
                  textInputAction: TextInputAction.next,
                  validator: (String userInput) {
                    if (userInput.length < 6) {
                      return 'Invalid Name';
                    }
                    print("made it user validator");
                    return null;
                  },
                  onSaved: (String userInput) {
                    _name = userInput;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  textInputAction: TextInputAction.next,
                  validator: (String userInput) {
                    if (!userInput.contains('@')) {
                      return 'Invalid Email';
                    }
                    print("made it user validator");
                    return null;
                  },
                  onSaved: (String userInput) {
                    _email = userInput;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  textInputAction: TextInputAction.next,
                  validator: (String userInput) {
                    if (userInput.length < 6) {
                      return 'Invalid Password';
                    }
                    print("made it user validator");
                    _formKey.currentState.save();
                    return null;
                  },
                  onSaved: (String userInput) {
                    _password = userInput;
                  },
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
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  child: Text("Submit"),
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
