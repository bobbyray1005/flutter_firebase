import 'package:flutter/material.dart';
import 'package:ultimatefirebase/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(title: Text("Home"), actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.person)),
          IconButton(onPressed: () async {
            await _auth.signOut();
          }, icon: Icon(Icons.exit_to_app)),
        ],),
      )
    );
  }
}
