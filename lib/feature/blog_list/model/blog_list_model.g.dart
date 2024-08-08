// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlogListModelImpl _$$BlogListModelImplFromJson(Map<String, dynamic> json) =>
    _$BlogListModelImpl(
      blogs: (json['blogs'] as List<dynamic>)
          .map((e) => Blog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BlogListModelImplToJson(_$BlogListModelImpl instance) =>
    <String, dynamic>{
      'blogs': instance.blogs,
    };
