import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Post {
  String title;
  String uid;
  String body;
  User _user;
  Set usersLiked = {};
  DatabaseReference _id;
  String img;

  Post({
    @required this.uid,
    @required this.title,
    @required this.img,
    @required this.body,
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
