import 'package:hive/hive.dart';

part 'fact.g.dart';

@HiveType(typeId: 1)
class FactHive {
  FactHive({required this.text, required this.date});

  @HiveField(0)
  String text;

  @HiveField(1)
  DateTime date;
}
