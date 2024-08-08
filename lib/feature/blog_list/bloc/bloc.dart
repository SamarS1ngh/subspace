import 'package:feature_based/feature/blog_list/bloc/blog_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../respository/blog_repo.dart';
import 'blog_states.dart';

class BlogListBloc extends Bloc<BlogListEvent, BlogListState> {
  final BlogRepository blogRepository; // Your data access layer

  BlogListBloc({required this.blogRepository}) : super(BlogListInitial()) {
    on<FetchBlogList>((event, emit) async {
      emit(BlogListLoading());
      try {
        final blogs = await blogRepository.getBlogs();

        emit(BlogListLoaded(blogs: blogs));
      } catch (e) {
        emit(BlogListError(message: 'Failed to load blogs'));
      }
    });
  }
}
