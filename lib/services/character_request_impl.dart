import 'dart:convert';

import 'package:character_viewer/models/character_model.dart';
import 'package:character_viewer/services/character_request.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@Injectable(as: CharacterRequest)
class CharacterRequestImpl extends CharacterRequest {
  static const String _hostName = "api.duckduckgo.com";
  @override
  Future<List<CharacterDetail>> getCharacterLists(CharacterType type) async {
    Uri characterUri =
        Uri.http(_hostName, "/", {'q': type.queryValue, 'format': 'json'});
    try {
      http.Response res = await http.get(characterUri);
      dynamic jsonRes = jsonDecode(res.body);
      List relatedTopics = jsonRes["RelatedTopics"];
      List<CharacterDetail> result =
          relatedTopics.map((e) => CharacterDetail.fromJson(e)).toList();
      return result;
    } catch (e) {
      return [];
    }
  }
}
