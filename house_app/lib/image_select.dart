import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelect extends StatefulWidget {
  const ImageSelect({Key? key}) : super(key: key);
  @override
  _ImageSelectState createState() => _ImageSelectState();
}

List myColors = <Color>[
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.indigo,
];
Color changeColor = myColors[0];

class _ImageSelectState extends State<ImageSelect> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Image'),
        ),
       // backgroundColor: Color.fromARGB(255, 128, 0, 32),
        backgroundColor: Colors.grey.shade300,
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imageFile != null)
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(changeColor, BlendMode.softLight),
                    child: Container(
                      width: 640,
                      height: 480,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(image: FileImage(imageFile!)),
                        border: Border.all(width: 8, color: Colors.black12),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  )
                else
                  Container(
                    width: 640,
                    height: 480,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 8, color: Colors.black12),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      'Your Image Should Appear Here',
                      style: TextStyle(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton.icon(
                            onPressed: () =>
                                getImage(source: ImageSource.camera),
                            icon: const Icon(Icons.camera),
                            label: const Text('Camera'),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 200, 50, 50))))),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                          onPressed: () =>
                              getImage(source: ImageSource.gallery),
                          icon: Icon(Icons.image),
                          label: const Text('Gallery'),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 200, 50, 50)))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                buildColorIcons(),
              ],
            )
        )
    );
  }

  Widget buildColorIcons() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (var i = 0; i < 6; i++) buildIconBtn(myColors[i])],
    );

  Widget buildIconBtn(Color myColor) => Container(
    child: Stack(
      children: [
        Positioned(
          top: 12.5,
          left: 12.5,
          child: Icon(
            Icons.check,
            size: 20,
            color: changeColor == myColor ? myColor : Colors.transparent,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.circle,
            color: myColor.withOpacity(0.65),
            size: 30,
          ),
          onPressed: () {
            setState(() {
              changeColor = myColor;
            });
          },
        ),
      ],
    ),
  );

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}
