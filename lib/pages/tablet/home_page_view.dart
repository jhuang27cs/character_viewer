import 'package:character_viewer/models/character_model.dart';
import 'package:character_viewer/pages/phone/detail_screen_view.dart';
import 'package:character_viewer/pages/phone/list_screen/list_screen_page.dart';
import 'package:character_viewer/services/character_request.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final CharacterType type;
  const HomePage({super.key, required this.type});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CharacterDetail? selectedCharacter;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
          flex: 1,
          child: ListScreenPage(
            currentType: widget.type,
            characterSelected: (character) {
              setState(() {
                selectedCharacter = character;
              });
            },
          )),
      Flexible(
          flex: 2,
          child: DetailScreen(
            details: selectedCharacter,
          )),
    ]);
  }
}
