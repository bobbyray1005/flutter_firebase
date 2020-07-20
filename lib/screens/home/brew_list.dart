import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimatefirebase/models/brew.dart';
import 'package:ultimatefirebase/screens/home/brew_tile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? [];
    if (brews != null && brews is List<Brew>) {
      // This check
      brews.forEach((brew) {
        print(brew.name);
        print(brew.sugars);
      });
    }

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index){
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
