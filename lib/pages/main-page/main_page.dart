import 'package:flutter/material.dart';
import 'package:prog4_aval3_nasa/pages/image-page/image_page.dart';
import 'package:prog4_aval3_nasa/pages/main-page/components/alert_dialog.dart';
import 'package:prog4_aval3_nasa/pages/main-page/components/create_images.dart';
import 'package:prog4_aval3_nasa/pages/main-page/components/image_card.dart';
import 'package:prog4_aval3_nasa/pages/main-page/components/search_bar.dart';
import 'package:prog4_aval3_nasa/pages/team-page/team_page.dart';
import 'package:prog4_aval3_nasa/requisitions/image_requisitions.dart';

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
        title: const Text(
          'APOD',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              getImages(listLength);
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const TeamPage()));
            },
            icon: const Icon(Icons.group),
          ),
        ],
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
                        dialogMessage: 'Erro ao obter imagens!',
                        buttonText: 'Tentar novamente',
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
                        listLength = int.parse(textController.text);
                        if (listLength < 1 || listLength > 20) {
                          _showDialog();
                        } else {
                          setState(() {
                            getImages(listLength);
                          });
                        }
                      },
                    ),
                    createImages(context, snapshot, listLength, () {
                      setState(() {});
                    })
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
          onpress: () {
            Navigator.pop(context);
          },
          buttonText: 'Tentar novamente',
          dialogMessage: 'A quantidade de imagens deve estar entre 1 e 20'),
    );
  }
}
