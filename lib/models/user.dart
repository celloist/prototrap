import 'package:flutter/material.dart';


class User {
  final String id;
  final String email;
  final String password;
  final String accessToken;
  final String refreshToken;

  User({
      this.accessToken,
      this.refreshToken,
    @required this.id,
    @required this.email,
    @required this.password,
  });
}