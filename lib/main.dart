import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantsnest/Models/expense.dart';
import 'package:plantsnest/Screens/ExpenseScreen.dart';
import 'package:plantsnest/Screens/GoalsScreen.dart';
import 'package:plantsnest/Screens/LandingScreen.dart';
import './Screens/SignupScreen.dart';
import './Screens/NestScreen.dart';
import './Screens/TimelineScreen.dart';
import './Screens/ImageScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const Color black = Color(0xFF000000);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LandingPage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => LandingScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        NestScreen.routeName: (ctx) => NestScreen(),
        TimelineScreen.routeName: (ctx) => TimelineScreen(),
        GoalScreen.routeName: (ctx) => GoalScreen(),
        ExpenseScreen.routeName: (ctx) => ExpenseScreen(),
        ImageScreen.routeName: (ctx) => ImageScreen(),
      },
    );
  }
}
