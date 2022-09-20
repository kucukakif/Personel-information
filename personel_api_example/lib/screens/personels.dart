import 'package:flutter/material.dart';
import 'package:personel_api_example/global_widget/toast_message.dart';
import 'package:personel_api_example/model/Personel.dart';
import 'package:personel_api_example/screens/personel_add.dart';
import 'package:personel_api_example/screens/personel_feature.dart';
import 'package:personel_api_example/services/personel_service.dart';

import '../model/Departman.dart';
import '../services/departman_service.dart';

class PersonelsPage extends StatefulWidget {
  const PersonelsPage({Key? key}) : super(key: key);

  @override
  State<PersonelsPage> createState() => _PersonelsPageState();
}

class _PersonelsPageState extends State<PersonelsPage> {
  PersonelService service = PersonelService();
  List<Personel?> personels = [];
  DepartmanService service1 = DepartmanService();
  List<Departman>? departmans = [];
  @override
  void initState() {
    super.initState();
    service.getPersonels().then((value) => setState(() {
          try {
            if (value != null) {
              personels = value;
            }
          } catch (e) {
            // ignore: avoid_print
            print(e.toString());
          }
        }));
    service1.getDepartmans().then((value) => setState(() {
          try {
            if (value != null) {
              departmans = value;
            }
          } catch (e) {
            // ignore: avoid_print
            print(e.toString());
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 102, 99, 99),
        title: const Text('Personeller'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: Image.asset(
              'assets/images/p_logo.jpg',
              width: 33,
              height: 33,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 96, top: 8, right: 50),
            child: Row(
              children: [
                Text(
                  "İsim",
                  style: style,
                ),
                const SizedBox(
                  width: 55,
                ),
                Text(
                  "Şifre",
                  style: style,
                ),
                const SizedBox(
                  width: 35,
                ),
                Text(
                  "Departman",
                  style: style,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 7, right: 7),
            child: Divider(
              thickness: 1.1,
              color: Colors.black,
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: personels.length,
              itemBuilder: (context, index) {
                var personel = personels[index];
                var departman = departmans![index];
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PersonelFeature(
                                          departman: departman,
                                          personel: personel!,
                                        )));
                              },
                              child: const Icon(
                                Icons.account_circle_outlined,
                                size: 35,
                              ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  personel!.name.toString(),
                                  style: _style,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 17),
                                  child: Text(
                                    personel.surname.toString(),
                                    style: _style,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                              personel.password.toString(),
                              style: _style,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              personel.departman.toString(),
                              style: _style,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    service.deletePersonel(id: personel.id);
                                  });
                                  toastMessage("Personel Silindi");
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 33,
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Divider(
                        height: 10,
                        thickness: 1.4,
                        color: Colors.black,
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 102, 99, 99),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PersonelAdd()));
            },
            icon: const Icon(
              Icons.add,
              color: Colors.orange,
              size: 30,
            )),
      ),
    );
  }

  // ignore: prefer_final_fields
  TextStyle _style = const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  TextStyle style = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFFFFB74D));
}
