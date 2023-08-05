import 'package:character_viewer/models/character_model.dart';

enum CharacterType {
  wireCharacter,
  simpsonsCharacters,
}

extension CharacterTypeExtension on CharacterType {
  String get queryValue {
    switch (this) {
      case CharacterType.wireCharacter:
        return "the wire characters";
      case CharacterType.simpsonsCharacters:
        return "simpsons characters";
    }
  } 
}

abstract class CharacterRequest {
  Future<List<CharacterDetail>> getCharacterLists(CharacterType type);
}