import 'package:json_annotation/json_annotation.dart';
import 'package:naps_app/models/business_endpoint/source_model.dart';

part 'article_model.g.dart';

@JsonSerializable()
class Article {
  final Source source;
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  Article(
      {required this.source,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
