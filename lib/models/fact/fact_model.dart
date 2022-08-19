import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'fact_model.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com/")
abstract class RestFactClient {
  factory RestFactClient(Dio dio, {String baseUrl}) = _RestFactClient;

  @GET("/facts/random")
  Future<Fact> getRandomFact();
}

@JsonSerializable()
class Fact {
  Fact({required this.text, required this.createdAt});

  /// Text of fact.
  String text;

  /// Date when fact was created.
  DateTime createdAt;

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);
}
