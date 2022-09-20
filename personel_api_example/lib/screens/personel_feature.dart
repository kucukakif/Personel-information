import 'package:flutter/material.dart';
import 'package:personel_api_example/global_widget/toast_message.dart';
import 'package:personel_api_example/model/Departman.dart';
import 'package:personel_api_example/model/Personel.dart';
import 'package:personel_api_example/services/personel_service.dart';

import '../services/departman_service.dart';

class PersonelFeature extends StatefulWidget {
  PersonelFeature({super.key, required this.departman, required this.personel});
  Personel personel;
  Departman? departman;

  @override
  State<PersonelFeature> createState() => _PersonelFeatureState();
}

List<String> list = <String>['Seçiniz'];

class _PersonelFeatureState extends State<PersonelFeature> {
  TextEditingController nameController = TextEditingController();

  TextEditingController surnameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  DepartmanService dService = DepartmanService();

  PersonelService pService = PersonelService();

  @override
  void initState() {
    super.initState();
    var personel = widget.personel;
    nameController.text = personel.name.toString();
    surnameController.text = personel.surname.toString();
    passwordController.text = personel.password.toString();
    dService.getDepartmans().then((value) => setState(() {
          for (int i = 0; i < value!.length; i++) {
            list.remove(value[i].name);
            list.add(value[i].name);
          }
        }));
    var departman = widget.departman;
    dropdownValue = departman!.name.toString();
  }

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFFFCC80),
        elevation: 0,
        title: const Text(
          "Güncelle",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 32,
              color: Color.fromARGB(255, 102, 99, 99),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 420,
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15,
                          )
                        ]),
                    width: double.infinity,
                    height: 340,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 70, right: 70, top: 30),
                            child: Column(
                              children: [
                                textField(
                                    textInputType: TextInputType.name,
                                    controller: nameController,
                                    text: "Personel Name"),
                                const SizedBox(
                                  height: 20,
                                ),
                                textField(
                                    textInputType: TextInputType.name,
                                    controller: surnameController,
                                    text: "Personel Surname"),
                                const SizedBox(
                                  height: 20,
                                ),
                                textField(
                                    textInputType: TextInputType.emailAddress,
                                    controller: passwordController,
                                    text: "Personel Password"),
                                const SizedBox(
                                  height: 30,
                                ),
                                DropdownButton<String>(
                                  value: dropdownValue,
                                  underline: Container(
                                    height: 1,
                                    color: Colors.black26,
                                  ),
                                  onChanged: (newvalue) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValue = newvalue!;
                                    });
                                  },
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )
                              ],
                            )),
                      ],
                    )),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        pService.putPersonel(
                            id: widget.personel.id!.toInt(),
                            name: nameController.text,
                            surname: surnameController.text,
                            password: passwordController.text,
                            departman: dropdownValue);
                        dService.getIdDepartman(dropdownValue.length);
                        
                      });
                      toastMessage("Personel Güncellendi");
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFFFCC80))),
                    child: const Text("Güncelle",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textField(
      {required TextEditingController controller,
      required String text,
      required TextInputType textInputType}) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Bu alanı boş bıraktınız!';
        }
      },
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(gapPadding: 5),
        labelText: text,
      ),
    );
  }
}
