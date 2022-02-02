import 'package:flutter/material.dart';

class ColorSlider extends StatelessWidget {
  final _colorMap = {
    'Red.indianred:darkred': Color.fromARGB(255, 255, 0, 0),
    'Green.#22b14c:#004000': Colors.green,
    'Blue.lightskyblue:darkblue': Color.fromARGB(255, 0, 0, 255),
    'Navy.#0000CD:#000080': Color.fromARGB(255, 0, 0, 128),
    'Magenta.#FF00FF:#8B008B': Color.fromARGB(255, 255, 0, 255),
    'Indigo.#9370DB:#4B0082': Color.fromARGB(255, 75, 0, 130),
    'Orange.#FFA500:#FF8C00': Color.fromARGB(255, 255, 165, 0),
    'Turquoise.#40E0D0:#00CED1': Color.fromARGB(255, 64, 224, 208),
    'Purple.#9370DB:#6A0DAD': Colors.purple,
    'Bronze.#CD7F32:#524741': Color.fromARGB(255, 82, 71, 65),
    'Yellow.#FFFF19:#E0E200': Color.fromARGB(255, 255, 255, 0),
    'Burgundy.#9D2735:#800020': Color.fromARGB(255, 128, 0, 32),
    'Brown.chocolate:brown': Color.fromARGB(255, 165, 42, 42),
    'Beige.beige:#d9b382': Color.fromARGB(255, 245, 245, 220),
    'Maroon.#800000:#450000': Color.fromARGB(255, 128, 0, 0),
    'Gold.goldenrod:darkgoldenrod': Color.fromARGB(255, 255, 215, 0),
    'Grey.grey:darkgrey': Color.fromARGB(255, 128, 128, 128),
    'Black.black:#1B1B1B:': Color.fromARGB(255, 0, 0, 0),
    'Silver.#8B8B8B:silver': Color.fromARGB(255, 192, 192, 192),
    'White.ghostwhite:black': Color.fromARGB(255, 255, 255, 255),
    'Slate.#708090:#284646': Color.fromARGB(255, 47, 79, 79),
  };

  final Function(String) onColorSelected;

  ColorSlider({required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ..._colorMap.entries.map((MapEntry<String, Color> mapEntry) {
          return InkWell(
              borderRadius: BorderRadius.circular(50.0),
              onTap: () => onColorSelected(mapEntry.key),
              child: Container(
                height: 10,
                width: 0,
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: mapEntry.value,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: mapEntry.value,
                      offset: Offset(1.0, 2.0),
                    ),
                  ],
                ),
              ));
        })
      ],
    );
  }
}
