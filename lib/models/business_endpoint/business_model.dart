import 'package:json_annotation/json_annotation.dart';
import 'package:naps_app/models/business_endpoint/article_model.dart';

part 'business_model.g.dart';

@JsonSerializable()
class Business {
  List<Article> articles;

  Business({required this.articles});

  factory Business.fromJson(Map<String, dynamic> json) =>
      _$BusinessFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessToJson(this);
}
