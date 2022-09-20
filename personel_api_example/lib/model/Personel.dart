import 'dart:convert';

List<Personel> personelFromJson(String str) =>
    List<Personel>.from(json.decode(str).map((x) => Personel.fromJson(x)));

String personelToJson(Personel data) => json.encode(data.toJson());

class Personel {
  int? id;
  String? name;
  String? surname;
  String? password;
  String? dateOfBirth;
  String? departman;

  Personel(
      {this.id,
      this.name,
      this.surname,
      this.password,
      this.dateOfBirth,
      this.departman});

  Personel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    password = json['password'];
    dateOfBirth = json['dateOfBirth'];
    departman = json['departman'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['password'] = this.password;
    data['dateOfBirth'] = this.dateOfBirth;
    data['departman'] = this.departman;
    return data;
  }
}
