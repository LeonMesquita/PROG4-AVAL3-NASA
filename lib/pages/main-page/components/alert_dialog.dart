import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final VoidCallback onpress;
  const ErrorDialog({Key? key, required this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Erro ao obter imagens!',
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ElevatedButton(
            onPressed: onpress,
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 16, 13, 218)),
            child: const Text(
              'Tentar novamente',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
