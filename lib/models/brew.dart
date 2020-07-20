class Brew {
  final String name;
  final String sugars;
  final int strength;

  Brew({this.name, this.sugars, this.strength});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sugars'] = this.sugars;
    data['strength'] = this.strength;
    return data;
  }
}