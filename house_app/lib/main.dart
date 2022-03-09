import 'package:flutter/material.dart';
import 'package:house_app/imageselect.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:house_app/localization_service.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
  //runApp(const MaterialApp(
  //title: 'Navigation',
  //home: HomePage(),
  //));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      home: HomePage(),
    );

    // return Scaffold(
    //backgroundColor: const Color.fromARGB(255, 200, 50, 50),
    //appBar: AppBar(
    // title: const Text('Home Page'),
    //backgroundColor: const Color.fromARGB(255, 128, 0, 32),
    //),
    //body: Center(
    //child: SvgPicture.asset('assets/home1.svg'),
    //),
    //bottomNavigationBar: BottomAppBar(
    //color: const Color.fromARGB(255, 128, 0, 32),
    //child: IconButton(
    //icon: const Icon(Icons.brush_outlined),
    //color: Colors.white,
    //iconSize: 50,
    //splashRadius: 30,
    //onPressed: () {
    //Navigator.push(
    //  context,
    //MaterialPageRoute(
    //builder: (context) => const ImageSelect(),
    //));
    //},
    //),
    //),
    //);
  }
}
