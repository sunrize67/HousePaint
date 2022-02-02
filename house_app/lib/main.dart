import 'package:flutter/material.dart';
import 'package:house_app/imageselect.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 50, 50),
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Color.fromARGB(255, 128, 0, 32),
      ),
      body: Center(
        child: SvgPicture.asset('assets/home1.svg'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 128, 0, 32),
        child: IconButton(
          icon: const Icon(Icons.brush_outlined),
          color: Colors.white,
          iconSize: 50,
          splashRadius: 30,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageSelect(),
                ));
          },
        ),
      ),
    );
  }
}
