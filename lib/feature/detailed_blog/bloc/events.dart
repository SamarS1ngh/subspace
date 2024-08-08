import '../model/blog.dart';

abstract class DetailedBlogEvent {}

class AddToFavorites extends DetailedBlogEvent {
  final Blog favBlog;
  AddToFavorites({required this.favBlog});
}

class FetchFavorites extends DetailedBlogEvent {
  final Blog favBlog;
  FetchFavorites({required this.favBlog});
}
