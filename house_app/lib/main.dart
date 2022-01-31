import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MaterialApp(
    home: ImageSelect(),
  ));
}

class ImageSelect extends StatefulWidget {
  const ImageSelect({Key? key}) : super(key: key);

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Image'),
          centerTitle: true,
        ),

        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imageFile != null)
                  Container(
                    width: 640,
                    height: 480,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(image: FileImage(imageFile!)),
                      border: Border.all(width: 8, color: Colors.black12),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  )
                else
                  Container(
                    width: 640,
                    height: 480,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(width: 8, color: Colors.black12),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      'Your Image should appear here',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () => getImage(source: ImageSource.camera),
                          child: const Text('Camera',
                              style: TextStyle(fontSize: 18))),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () =>
                              getImage(source: ImageSource.gallery),
                          child: const Text('Select Image',
                              style: TextStyle(fontSize: 18))),
                    ),
                  ],
                ),
              ],
            )));
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}
