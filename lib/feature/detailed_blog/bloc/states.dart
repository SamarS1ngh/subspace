import '../model/blog.dart';

abstract class DetailedBlogStates {}

class InitialState extends DetailedBlogStates {}

class LoadingState extends DetailedBlogStates {}

class FavoriteState extends DetailedBlogStates {
  final Blog favBlog;
  FavoriteState({required this.favBlog});
}

class ErrorState extends DetailedBlogStates {
  final String message;
  ErrorState({required this.message});
}
