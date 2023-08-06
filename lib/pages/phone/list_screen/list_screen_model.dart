import 'package:character_viewer/injectable_init.dart';
import 'package:character_viewer/models/character_model.dart';
import 'package:character_viewer/services/character_request.dart';
import 'package:flutter/material.dart';

class ListScreenModel with ChangeNotifier {
  List<CharacterDetail> listOfCharacters = [];
  BuildContext context;
  late CharacterRequest services;
  CharacterType currenType;
  ListScreenModel(this.context, this.currenType) {
    services = getIt.get<CharacterRequest>();
  }

  Future<List<CharacterDetail>> getCharacterLists() async {
    List<CharacterDetail> result = [];
    result = await services.getCharacterLists(currenType);
    listOfCharacters = result;
    return result;
  }
}
