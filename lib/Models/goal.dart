import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Goal {
  String title;
  String uid;
  String body;
  User _user;
  Set usersLiked = {};
  DatabaseReference _id;
  String img;
  String date;

  Goal({
    this.title,
    this.body,
    this.date,
  });

  void update() {}

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'author': this._user,
      'body': this.body,
      'title': this.title,
      'img': this.img,
      'uid': this.uid,
    };
  }
}
