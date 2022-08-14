import 'package:flutter/material.dart';
import 'package:prog4_aval3_nasa/components/custom_button.dart';
import 'package:prog4_aval3_nasa/pages/main-page/main_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/nasa.jpg'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Astronomy Picture Of the Day',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              CustomButton(
                  buttonText: 'Iniciar',
                  onpress: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MainPage()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
