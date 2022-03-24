import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'word_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class WordModel extends HiveObject {
  @HiveField(0)
  String word;
  @HiveField(1)
  String id;
  @HiveField(2)
  String definition;
  @HiveField(3)
  String example;
  @HiveField(4)
  String lesson;

  WordModel(this.word,this.id, this.definition, this.example, this.lesson);

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return _$WordModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WordModelToJson(this);
}