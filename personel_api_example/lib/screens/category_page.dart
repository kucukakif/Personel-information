import 'package:flutter/material.dart';
import 'package:personel_api_example/screens/departmans.dart';
import 'package:personel_api_example/screens/personels.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 102, 99, 99),
        title: const Text(
          'Listeler',
        ),
        leading: const Icon(
          Icons.format_align_justify,
          size: 29,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: Image.asset(
              'assets/images/p_logo.jpg',
              width: 33,
              height: 33,
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Lists('Personeller', () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PersonelsPage()));
                  }, Icons.assignment_ind),
                  Lists('Departmanlar', () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DepartmansPage()));
                  }, Icons.assignment)
                ],
              );
            }),
      ),
    );
  }

  TextStyle _style = TextStyle(fontWeight: FontWeight.w500, fontSize: 20);

  Container Lists(String text, VoidCallback onPress, IconData iconData) {
    return Container(
      height: 70,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                iconData,
                size: 25,
              ),
              Text(
                text,
                style: _style,
              ),
              IconButton(
                  onPressed: onPress,
                  icon: const Icon(
                    Icons.arrow_forward_outlined,
                    size: 25,
                  )),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.8,
          )
        ],
      ),
    );
  }
}
