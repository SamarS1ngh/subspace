import 'package:freezed_annotation/freezed_annotation.dart';
part 'blog.freezed.dart';
part 'blog.g.dart';

@freezed
class Blog with _$Blog {
  const factory Blog({
    String? id,
    // ignore: non_constant_identifier_names
    String? image_url,
    String? title,
  }) = _Blog;

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
}
