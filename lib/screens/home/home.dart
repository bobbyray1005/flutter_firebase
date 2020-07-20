import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimatefirebase/models/brew.dart';
import 'package:ultimatefirebase/screens/home/brew_list.dart';
import 'package:ultimatefirebase/screens/home/settings_form.dart';
import 'package:ultimatefirebase/services/auth.dart';
import 'package:ultimatefirebase/services/database.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return SettingsForm();
      });
    }

    return SafeArea(
      child: StreamProvider<List<Brew>>.value(
        value: DatabaseService().brews,
        child: Scaffold(
          backgroundColor: Colors.blueGrey[500],
          appBar: AppBar(title: Text("Home"), actions: [
            IconButton(onPressed: (){
              _showSettingsPanel();
            }, icon: Icon(Icons.person)),
            IconButton(onPressed: () async {
              await _auth.signOut();
            }, icon: Icon(Icons.exit_to_app)),
          ],),
          body: BrewList(),
        ),
      )
    );
  }
}
