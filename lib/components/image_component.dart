import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final String imageUrl;
  final double imageSize;
  const ImageComponent(
      {Key? key, required this.imageUrl, required this.imageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: FadeInImage.assetNetwork(
        image: imageUrl,
        placeholder: 'assets/images/Loading.gif',
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/images/error_image.png',
            height: imageSize,
            fit: BoxFit.cover,
          );
        },
        width: double.infinity,
        height: imageSize,
        fit: BoxFit.cover,
      ),
    );
  }
}
