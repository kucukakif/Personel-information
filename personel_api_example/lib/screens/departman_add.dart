import 'package:flutter/material.dart';
import 'package:personel_api_example/global_widget/toast_message.dart';

import '../services/departman_service.dart';

class DepartmanAdd extends StatefulWidget {
  const DepartmanAdd({super.key});

  @override
  State<DepartmanAdd> createState() => _DepartmanAddState();
}

class _DepartmanAddState extends State<DepartmanAdd> {
  DepartmanService service = DepartmanService();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFFFCC80),
        elevation: 0,
        title: const Text(
          "Ekle",
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
                  service.postDepartman(name: controller.text);
                  setState(() {
                    toastMessage("Departman Eklendi");
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFFFCC80))),
                child: const Text("Ekle",
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
