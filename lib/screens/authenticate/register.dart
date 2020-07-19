import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ultimatefirebase/services/auth.dart';
import 'package:ultimatefirebase/services/database.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[200],
        title: Text("Create New Account"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    validator: (val) => val.isEmpty ? "Enter an email" : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    validator: (val) => val.length > 6
                        ? "Enter a 6+ characters password"
                        : null,
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
                      color: Colors.orangeAccent,
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        print("register pressed...");
                        if (_formKey.currentState.validate()) {}
                        dynamic res =
                            await _auth.registerEmailPassword(email, password);
                        if (res == null) {
                          Fluttertoast.showToast(
                              msg: "Please provide a valid email",
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }

                        await DatabaseService(uid: res.uid)
                            .updateUserData("-", "-", 100);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      color: Colors.pink,
                      child: Text(
                        "Have an account ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        Navigator.pushReplacementNamed(context, '/signin');
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
