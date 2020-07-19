import 'package:flutter/material.dart';
import 'package:ultimatefirebase/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Sign In"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              RaisedButton(
                onPressed: () async {
                  dynamic result = await _auth.signInEmailPassword(
                      "moodlamps@gmail.com", "parola123");
                  if (result == null) {
                    print("Error signing in...");
                  } else {
                    print(result.uid);
                  }
                },
                child: Text("Sign In"),
                color: Colors.grey[100],
              )
            ],
          ),
        ),
      ),
    );
  }
}
