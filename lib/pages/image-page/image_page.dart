import 'package:flutter/material.dart';
import 'package:prog4_aval3_nasa/components/image_component.dart';
import 'package:prog4_aval3_nasa/models/image_model.dart';

class ImagePage extends StatelessWidget {
  final ImageModel selectedImage;

  const ImagePage({Key? key, required this.selectedImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 140, 219),
      body: Column(
        children: [
          ImageComponent(
              imageUrl: selectedImage.url, imageSize: size.height * .4),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 5.0,
                        offset: Offset(0, -10))
                  ],
                  image: DecorationImage(
                      image: AssetImage('assets/images/space5.jpeg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          selectedImage.title,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Image informations',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        informationText('Image URL: ${selectedImage.url}'),
                        informationText(
                            'Creation Date: ${selectedImage.date.replaceAll('-', '/')}'),
                        informationText(
                            'Copyright: ${selectedImage.copyright ?? 'No copyright'}'),
                        informationText('Image Explanation:'),
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 3)),
                          child: Text(
                            selectedImage.explanation,
                            textAlign: TextAlign.justify,
                            style: informationsStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget informationText(text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Text(
      text,
      style: informationsStyle,
    ),
  );
}

const informationsStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
