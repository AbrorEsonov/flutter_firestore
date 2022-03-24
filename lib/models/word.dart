import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Word extends HiveObject {
  @HiveField(0)
  final String actual_word;

  Word(this.actual_word);

  factory Word.fromJson(Map<String, dynamic> json) {
    return _$WordFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WordToJson(this);
}