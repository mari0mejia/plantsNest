import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Expense {
  String title;
  String body;
  User _user;
  DatabaseReference _id;
  double cost;

  Expense({
    this.title,
    this.body,
    this.cost,
  });

  void update() {}

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'body': this.body,
      'cost': this.cost,
    };
  }
}
