import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';
import 'package:flutter_app/pages/SignInPage.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class SignupApi {
  Future hitSignup(
      File filename,
      String url,
      String firstname,
      String lastname,
      String email,
      String password,
      String role,
      String phone,
      BuildContext context) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(http.MultipartFile.fromBytes(
        'profile_image', filename.readAsBytesSync(),
        filename: filename.path.toString()));
    request.fields['firstname'] = firstname;
    request.fields['lastname'] = lastname;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['role'] = role;
    request.fields['phone'] = phone;
    request.fields['Content-Type'] = 'multipart/form-data';

    var response = await request.send();
    final int statusCode = response.statusCode;

    if (statusCode != 200) {
      Toast.show("Oop's something went wrong", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } else {
      Navigator.push(context, ScaleRoute(page: SignInPage()));
    }
  }
}
