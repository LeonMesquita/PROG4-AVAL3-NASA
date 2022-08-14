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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedImage.url,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(selectedImage.url),
            Text(selectedImage.title),
            Text(selectedImage.date.toString()),
            Text(selectedImage.explanation),
          ],
        ),
      ),
    );
  }
}
