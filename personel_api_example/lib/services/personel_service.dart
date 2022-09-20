import 'package:personel_api_example/model/Departman.dart';
import 'package:personel_api_example/model/Personel.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class PersonelService {
  final String url = "https://10.0.2.2:7235/api/Personel";
  // ignore: body_might_complete_normally_nullable
  Future<List<Personel>?>
      // ignore: body_might_complete_normally_nullable
      getPersonels() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      try {
        return personelFromJson(res.body);
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    } else {
      // ignore: avoid_print
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  Future<List<Personel>?>
      // ignore: body_might_complete_normally_nullable
      deletePersonel({required int? id}) async {
    String url = "https://10.0.2.2:7235/api/Personel/$id";
    var res = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (res.statusCode == 200) {
      try {
        return personelFromJson(res.body);
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    } else {
      // ignore: avoid_print
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<List<Personel>?> putPersonel(
      {required String name,
      required int id,
      required String surname,
      required String password,
      required String departman}) async {
    var res = await http.put(Uri.parse("https://10.0.2.2:7235/api/Personel/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "name": name,
          "surname": surname,
          "password": password,
          "departman": departman,
        }));
    if (res.statusCode == 200) {
      try {
        return personelFromJson(res.body);
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    } else {
      // ignore: avoid_print
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  Future<List<Personel>?> postPersonel(
      {required String name,
      required String surname,
      required String password,
      required String departman}) async {
    var res = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "name": name,
          "surname": surname,
          "password": password,
          "departman": departman,
        }));
    if (res.statusCode == 200) {
      try {
        return personelFromJson(res.body);
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    } else {
      // ignore: avoid_print
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }
}
