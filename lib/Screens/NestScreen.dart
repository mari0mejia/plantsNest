import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './TimelineScreen.dart';

class NestScreen extends StatefulWidget {
  static const routeName = '/nests';
  String _user;

  @override
  _NestScreenState createState() => _NestScreenState();
}

class _NestScreenState extends State<NestScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, User>;
    final _user = routeArgs['user'];
    print('lol');
    print(_user.uid);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Get Ready to Grow'),
        ),
        drawer: Drawer(
          elevation: .5,
          child: Column(children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "PlantsNest",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('Timeline'),
                  leading: Icon(Icons.timeline_outlined),
                  onTap: () async {
                    await Navigator.pushNamed(
                      context,
                      TimelineScreen.routeName,
                      arguments: {'user': _user},
                    );
                  },
                ),
                ListTile(
                  title: Text('Goal List'),
                  leading: Icon(Icons.flag_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Expenses'),
                  leading: Icon(Icons.receipt_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () => _signOut(context),
                )
              ],
            )),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 0.1,
            ),
            Container(
                padding: EdgeInsets.all(10),
                height: 100,
                child: Text(
                  "V1.0.0",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ]),
        ),
        body: Center(
          child: Text('Hello'),
        ),
        backgroundColor: Colors.blueGrey.shade200,
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await Navigator.popAndPushNamed(context, '/');
  }
}
