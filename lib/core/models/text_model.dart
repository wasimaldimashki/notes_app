import 'package:hive/hive.dart';
part 'text_model.g.dart';

@HiveType(typeId: 1)
class TextModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  TextModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });
}
