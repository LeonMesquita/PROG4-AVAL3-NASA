import 'package:flutter/material.dart';
import 'package:prog4_aval3_nasa/pages/image-page/image_page.dart';
import 'package:prog4_aval3_nasa/pages/main-page/components/alert_dialog.dart';
import 'package:prog4_aval3_nasa/pages/main-page/components/image_card.dart';
import 'package:prog4_aval3_nasa/pages/main-page/components/search_bar.dart';
import 'package:prog4_aval3_nasa/repository/image_repository.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int listLength = 20;

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('NASA'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/space.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: SafeArea(
            child: FutureBuilder(
              future: getImages(listLength),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 300,
                      height: 300,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 6,
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return ErrorDialog(
                        onpress: () {
                          setState(() {
                            listLength = 20;
                            getImages(listLength);
                          });
                        },
                      );
                    }
                }
                return Column(
                  children: [
                    SearchBar(
                      controller: textController,
                      hintText: listLength.toString(),
                      onSearch: () {
                        setState(() {
                          listLength = int.parse(textController.text);
                          getImages(listLength);
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
      ),
    );
  }

  Widget createImages(BuildContext context, AsyncSnapshot snapshot) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          await getImages(listLength);
          setState(() {});
        },
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
      ),
    );
  }
}
