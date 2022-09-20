// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:personel_api_example/global_widget/toast_message.dart';

import 'package:personel_api_example/model/Departman.dart';
import 'package:personel_api_example/services/departman_service.dart';

class DepartmanFeature extends StatefulWidget {
  final Departman departman;
  DepartmanFeature({
    Key? key,
    required this.departman,
  }) : super(key: key);

  @override
  State<DepartmanFeature> createState() => _DepartmanFeatureState();
}

class _DepartmanFeatureState extends State<DepartmanFeature> {
  DepartmanService service = DepartmanService();

  TextEditingController controller = TextEditingController();

  String _name = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var departman = widget.departman;
    controller.text = departman.name;
  }

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
                height: 120,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 70, right: 70, top: 30),
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(gapPadding: 5),
                          labelText: "Departman Name",
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    service.putDepartman(
                        name: controller.text, id: widget.departman.id);
                  });
                  toastMessage("Departman Güncellendi");
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
    );
  }
}
