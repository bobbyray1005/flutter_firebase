import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ultimatefirebase/services/auth.dart';
import 'package:ultimatefirebase/shared/constants.dart';
import 'package:ultimatefirebase/shared/loading.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email = "";
  String password = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              backgroundColor: Colors.blue[700],
              title: Text("Sign In"),
              centerTitle: true,
              elevation: 0,
            ),
            body: Center(
              child: Container(
                padding: EdgeInsets.all(30.0),
                child: Form(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      decoration:
                          textInputDecoration.copyWith(hintText: "email"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: "password"),
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        color: Colors.green,
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          print("sign in pressed...");

                          setState(() {
                            loading = true;
                          });

                          dynamic res =
                              await _auth.signInEmailPassword(email, password);
                          if (res == null) {
                            setState(() {
                              loading = false;
                            });

                            Fluttertoast.showToast(
                                msg: "Invalid username or password",
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        color: Colors.orange,
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          print("register in pressed...");
                          Navigator.pushReplacementNamed(context, "/register");
                        },
                      ),
                    )
                  ],
                )),
              ),
            ),
          );
  }
}
