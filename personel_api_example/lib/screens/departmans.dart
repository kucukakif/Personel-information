import 'package:flutter/material.dart';
import 'package:personel_api_example/global_widget/toast_message.dart';
import 'package:personel_api_example/model/Departman.dart';
import 'package:personel_api_example/screens/departman_add.dart';
import 'package:personel_api_example/screens/departman_feature.dart';
import 'package:personel_api_example/services/departman_service.dart';

class DepartmansPage extends StatefulWidget {
  const DepartmansPage({Key? key}) : super(key: key);

  @override
  State<DepartmansPage> createState() => _DepartmansPageState();
}

class _DepartmansPageState extends State<DepartmansPage> {
  DepartmanService service = DepartmanService();
  List<Departman>? departmans = [];

  @override
  void initState() {
    super.initState();

    service.getDepartmans().then((value) => setState(() {
          departmans = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 102, 99, 99),
        title: const Text('Departmanlar'),
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
      body: ListView.builder(
          itemCount: departmans!.length,
          itemBuilder: (context, index) {
            var departman = departmans![index];
            return Column(
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            departman.name.toString(),
                            style: const TextStyle(
                                fontSize: 19, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          // ignore: list_remove_unrelated_type
                          setState(() {
                            service.deleteDepartman(departman.id);
                            toastMessage("Departman Silindi");
                          });
                          
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DepartmanFeature(
                                      departman: departman,
                                    )));
                          },
                          icon: const Icon(Icons.read_more))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Divider(
                    color: Colors.black,
                    thickness: 0.7,
                  ),
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 102, 99, 99),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DepartmanAdd()));
            },
            icon: const Icon(
              Icons.add,
              color: Colors.orange,
              size: 30,
            )),
      ),
    );
  }
}
