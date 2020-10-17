import 'package:flutter/material.dart';
import 'package:pro1/dashboard/dashboard_home.dart';
import 'package:pro1/donor/donor_login.dart';
import 'package:pro1/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    // Return either home or authenticate widget
    print("From wrapper.dart");
    print(user);
    if (user == null) {
      print(user);
      return Donorlogin();
    } else {
      print("Going to Dashboard");
      print(user.uid);
      return Dashboard("vaibhavgoley3@gmail.com");
    }
  }
}
