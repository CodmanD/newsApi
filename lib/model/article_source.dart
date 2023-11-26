import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_source.g.dart';

@JsonSerializable()
class ArticleSource extends Equatable {
  final String? id;
  final String? name;

  const ArticleSource({
    required this.id,
    required this.name,
  });

  factory ArticleSource.fromJson(Map<String, dynamic> json) =>
      _$ArticleSourceFromJson(json);

 // Map<String, dynamic>  toJson(ArticleSource articleSource) => _$ArticleSourceToJson(this);
  @override
  List<Object?> get props => [id, name];
}
