import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchBar extends StatelessWidget {
  var controller = TextEditingController();
  final String hintText;
  final VoidCallback onSearch;
  SearchBar(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.onSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Informe a quantidade de imagens',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 7,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: hintText,
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                          onPressed: onSearch,
                          icon: const Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 17, 79, 129),
                            size: 35,
                          ))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
