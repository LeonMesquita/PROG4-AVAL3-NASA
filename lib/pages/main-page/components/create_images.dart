import 'package:flutter/material.dart';
import 'package:prog4_aval3_nasa/pages/image-page/image_page.dart';
import 'package:prog4_aval3_nasa/pages/main-page/components/image_card.dart';
import 'package:prog4_aval3_nasa/requisitions/image_requisitions.dart';

Widget createImages(BuildContext context, AsyncSnapshot snapshot, listLength,
    Function onrefresh) {
  return Expanded(
    child: RefreshIndicator(
      onRefresh: () async {
        await getImages(listLength);
        onrefresh();
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
