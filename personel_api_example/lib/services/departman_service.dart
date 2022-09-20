import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:personel_api_example/model/Departman.dart';

class DepartmanService {
  final String url = "https://10.0.2.2:7235/api/Departman";
  // ignore: body_might_complete_normally_nullable
  Future<List<Departman>?> getDepartmans() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      try {
        return departmanFromJson(res.body);
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    } else {
      // ignore: avoid_print
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }

  Future<List<Departman>?> postDepartman({required String name}) async {
    var res = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );
    if (res.statusCode == 200) {
      try {
        return departmanFromJson(res.body);
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    } else {
      // ignore: avoid_print
      print("İstek başarısız oldu => ${res.statusCode}");
    }
    return null;
  }

  Future<List<Departman>?> deleteDepartman(int id) async {
    final String url1 = "https://10.0.2.2:7235/api/Departman/$id";
    var res = await http.delete(
      Uri.parse(url1),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (res.statusCode == 200) {
      try {
        return departmanFromJson(res.body);
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    } else {
      // ignore: avoid_print
      print("İstek başarısız oldu => ${res.statusCode}");
    }
    return null;
  }

  Future<List<Departman>?> getIdDepartman(int id) async {
    final String url1 = "https://10.0.2.2:7235/api/Departman/$id";
    var res = await http.get(Uri.parse(url1));
    if (res.statusCode == 200) {
      try {
        return departmanFromJson(res.body);
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    } else {
      // ignore: avoid_print
      print("İstek başarısız oldu => ${res.statusCode}");
    }
    return null;
  }

  Future<List<Departman>?> putDepartman(
      {required int id, required String name}) async {
    final res = await http.put(
      Uri.parse("https://10.0.2.2:7235/api/Departman/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {"name": name},
      ),
    );
    if (res.statusCode == 200) {
      try {
        return departmanFromJson(res.body);
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    } else {
      // ignore: avoid_print
      print("İstek başarısız oldu => ${res.statusCode}");
    }
    return null;
  }
}

// Departman.fromJson