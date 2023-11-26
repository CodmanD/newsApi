import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news/model/article_source.dart';

part 'article.g.dart';

@JsonSerializable()
class Article extends Equatable {
  final String? title;

  @JsonKey(name: 'description')
  final String? subTitle;

  @JsonKey(name: 'urlToImage')
  final String? imagePath;

  final String? content;

  final String? url;

  final DateTime? publishedAt;

  final ArticleSource? source;



  const Article({
    required this.title,
    required this.subTitle,
    required this.content,
    required this.publishedAt,
    required this.imagePath,
    required this.url,
    required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

 // Map<String, dynamic>  toJson(Article article) => _$ArticleToJson(this);

  @override
  List<Object?> get props => [title, publishedAt, subTitle, imagePath, content, source];
}
