class ImageModel {
  final String url;
  final String title;
  final String date;
  final String explanation;
  final String? copyright;

  ImageModel({
    required this.url,
    required this.title,
    required this.date,
    required this.explanation,
    this.copyright,
  });
}
