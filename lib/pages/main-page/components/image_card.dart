import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageCard extends StatelessWidget {
  final String imageSrc;
  final String imageTitle;
  final String imageDate;
  final VoidCallback onclick;
  const ImageCard({
    Key? key,
    required this.imageSrc,
    required this.onclick,
    required this.imageTitle,
    required this.imageDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GestureDetector(
        onTap: onclick,
        child: Column(
          children: [
            Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/Loading.gif',
                      image: imageSrc,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/error_image.png',
                          height: 300,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          imageTitle,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Picture taken in ${imageDate.replaceAll('-', '/')}',
                          style: const TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
