// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:personel_api_example/screens/category_page.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: const CategoryPage(),
        // title: const Text(
        //   'Personel Takip\n Uygulamasına Hoşgeldiniz',
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        // ),
        image: Image.asset('assets/images/p_logo.jpg'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: const TextStyle(),
        photoSize: 150.0,
        loaderColor: const Color(0xFFFBC02D));
  }
}
