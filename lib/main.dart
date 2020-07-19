import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimatefirebase/screens/authenticate/register.dart';
import 'package:ultimatefirebase/screens/authenticate/sign_in.dart';
import 'package:ultimatefirebase/screens/wrapper.dart';
import 'package:ultimatefirebase/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        routes: {
          '/register': (context) => Register(),
          '/signin': (context) => SignIn()
        },
        title: 'Ultimate Firebase',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}
