import 'package:freezed_annotation/freezed_annotation.dart';

import '../../detailed_blog/model/blog.dart';

part 'blog_list_model.freezed.dart';
part 'blog_list_model.g.dart';

// BlogListModel blogListModelFromJson(String str) =>
//     BlogListModel.fromJson(json.decode(str));

// String blogListModelToJson(BlogListModel data) => json.encode(data.toJson());

@freezed
class BlogListModel with _$BlogListModel {
  const factory BlogListModel({
    required List<Blog> blogs,
  }) = _BlogListModel;

  factory BlogListModel.fromJson(Map<String, dynamic> json) =>
      _$BlogListModelFromJson(json);
}
