import '../../detailed_blog/model/blog.dart';

abstract class BlogListState {}

class BlogListInitial extends BlogListState {}

class BlogListLoading extends BlogListState {}

class BlogListLoaded extends BlogListState {
  final List<Blog> blogs;
  BlogListLoaded({required this.blogs});
}

class BlogListError extends BlogListState {
  final String message;
  BlogListError({required this.message});
}
