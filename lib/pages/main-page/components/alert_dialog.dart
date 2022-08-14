import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final VoidCallback onpress;
  final String dialogMessage;
  final String buttonText;
  const ErrorDialog(
      {Key? key,
      required this.onpress,
      required this.dialogMessage,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        dialogMessage,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ElevatedButton(
            onPressed: onpress,
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 16, 13, 218)),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
