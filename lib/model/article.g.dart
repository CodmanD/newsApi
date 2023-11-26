// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String?,
      subTitle: json['description'] as String?,
      content: json['content'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      imagePath: json['urlToImage'] as String?,
      url: json['url'] as String?,
      source: json['source'] == null
          ? null
          : ArticleSource.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.subTitle,
      'urlToImage': instance.imagePath,
      'content': instance.content,
      'url': instance.url,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'source': instance.source,
    };
