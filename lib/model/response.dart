import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'response.g.dart';

@JsonSerializable()
class ServerMessage extends Equatable {

  final String? status;
  final int? totalResult;
  final List<Article>? articles;

  const ServerMessage({
    required this.status,
    required this.totalResult,
    required this.articles,

  });

  factory ServerMessage.fromJson(Map<String, dynamic> json) =>
      _$ServerMessageFromJson(json);

  // Map<String, dynamic>  toJson(ArticleSource articleSource) => _$ArticleSourceToJson(this);
  @override
  List<Object?> get props => [status, totalResult,articles];
}
