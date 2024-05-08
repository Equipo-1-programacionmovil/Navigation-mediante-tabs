import 'package:app/componets/btn.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class page1 extends StatelessWidget {
  const page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 222, 222, 222),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Aqui ya pueden personaliar todo lo quieran y agregar mas componentes si necesitan.
            const SizedBox(height: 50),
            const Text(
              'Titulo',
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(222, 255, 254, 254),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            MyButton(
              onPressed: () {},
              text: 'Mover',
            ),

            //Aqui es final Children.
          ],
        ),
      )),
    );
  }
}
