import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prog4_aval3_nasa/models/image_model.dart';

class ImagePage extends StatelessWidget {
  final ImageModel selectedImage;

  const ImagePage({Key? key, required this.selectedImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(
            selectedImage.url,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedImage.title,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Informações da imagem',
                      textAlign: TextAlign.start,
                    ),
                    Text(selectedImage.url),
                    Text(selectedImage.date.toString()),
                    Text(
                      selectedImage.explanation,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
