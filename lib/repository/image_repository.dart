import 'package:http/http.dart' as http;
import 'package:prog4_aval3_nasa/models/image_model.dart';
import 'dart:convert';

Future getImages(int listLength) async {
  const apiUrl = 'https://api.nasa.gov/planetary/apod';
  const apiKey = 'gkzCE5oTlTHRLzLPPaWo4kS0rhSlaIT3e6DuFV39';
  List<ImageModel> generatedList = [];
  http.Response response =
      await http.get(Uri.parse('$apiUrl?count=$listLength&api_key=$apiKey'));
  Iterable responseMap = jsonDecode(utf8.decode(response.bodyBytes));
  responseMap
      .map(
        (item) => generatedList.add(
          ImageModel(
              url: item['url'],
              title: item['title'],
              date: item['date'],
              explanation: item['explanation']),
        ),
      )
      .toList();
  return generatedList;
}
