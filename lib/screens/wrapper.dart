import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimatefirebase/models/user.dart';
import 'package:ultimatefirebase/screens/authenticate/authenticate.dart';
import 'package:ultimatefirebase/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
