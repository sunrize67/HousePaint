import 'package:flutter/material.dart';
import 'package:house_app/localization_service.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lng = 'English';

  @override
  Widget build(BuildContext context) {
    var redAccent;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Multilanguage App'),
        elevation: 0,
        backgroundColor: redAccent,
      ),
      body: Center(
        child: _iuWidget(),
      ),
    );
  }

  _iuWidget() {}
}

// ignore: unused_element
Widget _uiWidget() {
  var lng;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'hello title'.tr,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Language',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(" "),
          // ignore: unnecessary_new
          new DropdownButton<String>(
            items: LocalizationService.langs.map(
              (String value) {
                // ignore: unnecessary_new
                return new DropdownMenuItem<String>(
                  value: value,
                  // ignore: unnecessary_new
                  child: new Text(value),
                );
              },
            ).toList(),
            value: lng,
            underline: Container(),
            isExpanded: false,
            onChanged: (newVal) {
              setState(() {
                lng = newVal;
                LocalizationService().changeLocale(newVal!);
              });
            },
          ),
        ],
      )
    ],
  );
}

void setState(Null Function() param0) {}
