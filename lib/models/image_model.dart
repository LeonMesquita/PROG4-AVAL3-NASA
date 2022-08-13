//imagem, título, data, explicação e copyright
class ImageModel {
  final String image;
  final String title;
  final DateTime date;
  final String explanation;
  final String copyright;

  ImageModel({
    required this.image,
    required this.title,
    required this.date,
    required this.explanation,
    required this.copyright,
  });
}
