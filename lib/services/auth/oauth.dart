import 'package:flutter/material.dart';
import 'package:http/http.dart';


class OAuth {

}

class OAuthModel{
  final String callback;
  final String accessToken;
  final String refreshToken;

  OAuthModel({this.callback, this.accessToken, this.refreshToken});
}