// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetail _$CharacterDetailFromJson(Map<String, dynamic> json) =>
    CharacterDetail()
      ..iconUrl = stringFromJson(json['Icon'] as Map<String, dynamic>)
      ..text = json['Text'] as String?;

Map<String, dynamic> _$CharacterDetailToJson(CharacterDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Icon', stringToJson(instance.iconUrl));
  writeNotNull('Text', instance.text);
  return val;
}
