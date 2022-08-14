import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prog4_aval3_nasa/models/image_model.dart';
import 'package:prog4_aval3_nasa/pages/image-page/image_page.dart';
import 'package:prog4_aval3_nasa/pages/main-page/components/image_card.dart';
import 'package:http/http.dart' as http;
import 'package:prog4_aval3_nasa/pages/main-page/components/search_bar.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final apiUrl = 'https://api.nasa.gov/planetary/apod';

  final apiKey = 'gkzCE5oTlTHRLzLPPaWo4kS0rhSlaIT3e6DuFV39';

  int listLength = 20;

  Future getImages() async {
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

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
//https://i.pinimg.com/originals/9f/33/bc/9f33bcf999c0458b90dad3b7c429f08a.jpg

//https://i.pinimg.com/originals/17/2b/0e/172b0eb9874db3c04104c9f5f0589a90.jpg
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage(''), fit: BoxFit.cover),
        ),
        child: Center(
          child: FutureBuilder(
            future: getImages(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Container(
                    width: 300,
                    height: 300,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.hasError) return Container();
              }
              return //createImages(context, snapshot);
                  Column(
                children: [
                  SearchBar(
                    controller: textController,
                    hintText: listLength.toString(),
                    onSearch: () {
                      setState(() {
                        listLength = int.parse(textController.text);
                        getImages();
                      });
                    },
                  ),
                  createImages(context, snapshot)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget createImages(BuildContext context, AsyncSnapshot snapshot) {
  print(snapshot.data[0].url);
  return Expanded(
    child: ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: ImageCard(
                imageSrc: snapshot.data[index].url,
                onclick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) =>
                          ImagePage(selectedImage: snapshot.data[index])),
                    ),
                  );
                },
                imageTitle: snapshot.data[index].title,
                imageDate: snapshot.data[index].date),
          );
        }),
  );
}
