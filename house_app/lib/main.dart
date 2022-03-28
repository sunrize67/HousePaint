import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:house_app/localization_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'image_select.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 200, 50, 50),
        bottomNavigationBar: BottomAppBar(
            color: const Color.fromARGB(255, 128, 0, 32),
            child: IconButton(
                icon: const Icon(Icons.brush_outlined),
                color: Colors.white,
                iconSize: 50,
                splashRadius: 30,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ImageSelect())))),
        body: Center(child: SvgPicture.asset('assets/home1.svg')),
      ),
      title: 'HousePaint',
      translations: LocalizationService(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        //Define splash effects colors
        splashColor: Colors.redAccent.shade400,
        highlightColor: Colors.black.withOpacity(0.1),

        //Define AppBar Style
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red.shade900,
          centerTitle: true,
          toolbarTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
