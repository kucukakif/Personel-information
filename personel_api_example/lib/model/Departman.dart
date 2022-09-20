// To parse this JSON data, do
//
//     final departman = departmanFromJson(jsonString);

import 'dart:convert';

List<Departman> departmanFromJson(String str) =>
List<Departman>.from(json.decode(str).map((x) => Departman.fromJson(x)));

String departmanToJson(List<Departman> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Departman {

  
    Departman({
        required this.id,
        required this.name,
    });

    int id;
    String name;

    factory Departman.fromJson(Map<String, dynamic> json) => Departman(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
    };
}

