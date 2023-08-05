import 'package:json_annotation/json_annotation.dart';
part 'character_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CharacterDetail {
  @JsonKey(name: "Icon", fromJson: stringFromJson, toJson: stringToJson)
  String? iconUrl;
  @JsonKey(name: "Text")
  String? text;
  String? get name {
    return text?.split("-").first ?? "";
  }

  String? get detail {
    return text?.split("-").last.replaceFirst(" ", "") ?? "";
  }

  CharacterDetail();
  factory CharacterDetail.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterDetailToJson(this);
}

String? stringFromJson(Map<String, dynamic> json) {
  String? url;
  if (json["URL"] != "") {
    url = "https://duckduckgo.com${json["URL"]}";
  }
  return url;
}

Map<String, String>? stringToJson(String? url) {
  return {"URL": url ?? ""};
}
