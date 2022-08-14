import 'package:flutter/material.dart';
import 'package:prog4_aval3_nasa/components/custom_button.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 31, 54),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            teamText('Membros da equipe:'),
            teamText('Leonardo Evangelista Mesquita'),
            teamText('Marcos Vinicius dos Santos Dantas'),
            teamText('Arthur Oliveira de Souza'),
            const Expanded(child: SizedBox()),
            CustomButton(
                buttonText: 'Voltar',
                onpress: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}

Widget teamText(text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Text(
      text,
      style: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
  );
}
