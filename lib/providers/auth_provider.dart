import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/signin_form_model.dart';
import '../models/signup_form_model.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  // Changer par localhost pour Web
  final String host = 'http://localhost:8080';
  bool isLoading = false;

  Future<dynamic> signup(SignupForm signupForm) async {
    try {
      isLoading = true;
      http.Response response = await http.post(
        Uri.parse('$host/user'),
        headers: {'Content-type': 'application/json'},
        body: json.encode(signupForm.toJson()),
      );
      isLoading = false;
      if (response.statusCode != 200) {
        return json.decode(response.body);
      }
      return null;
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }


  Future<dynamic> signin(SigninForm signinForm) async {
    try {
      isLoading = true;
      http.Response response = await http.post(
        Uri.parse('$host/auth'),
        headers: {'Content-type': 'application/json'},
        body: json.encode(
          signinForm.toJson(),
        ),
      );
      final Map<String, dynamic> body = json.decode(response.body);
      if (response.statusCode == 200) {
        final User user = User.fromJson(body['user']);
        var token = body['token'];
        return user;
      } else {
        return body;
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}