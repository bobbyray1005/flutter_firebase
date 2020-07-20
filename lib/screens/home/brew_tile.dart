import 'package:flutter/material.dart';
import 'package:ultimatefirebase/models/brew.dart';


class BrewTile extends StatelessWidget {

  final Brew brew;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(color: Colors.green[200],
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: ListTile(title: Text(brew.name), leading: CircleAvatar(radius: 25.0, backgroundColor: Colors.brown[brew.strength],), subtitle: Text('${brew.sugars} sugars'),),),
    );
  }
}
