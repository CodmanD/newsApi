// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerMessage _$ServerMessageFromJson(Map<String, dynamic> json) =>
    ServerMessage(
      status: json['status'] as String?,
      totalResult: json['totalResult'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServerMessageToJson(ServerMessage instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResult': instance.totalResult,
      'articles': instance.articles,
    };
