import 'dart:developer';
import 'package:feature_based/feature/detailed_blog/bloc/events.dart';
import 'package:feature_based/feature/detailed_blog/bloc/states.dart';
import 'package:feature_based/feature/detailed_blog/model/blog.dart';
import 'package:feature_based/feature/detailed_blog/repository/fav_blogs_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailedBlogBloc extends Bloc<DetailedBlogEvent, DetailedBlogStates> {
  final FavBlogsRepo favBlogsRepo;
  DetailedBlogBloc({required this.favBlogsRepo}) : super(InitialState()) {
    on<FetchFavorites>((event, emit) async {
      try {
        log('fetchfavorites event triggered');
        List<Blog> favBlogs = await favBlogsRepo.getFavBlogs();

        if (favBlogs.isNotEmpty) {
          Blog favBlog = favBlogs.firstWhere(
            (blog) => blog.id == event.favBlog.id,
            orElse: () => const Blog(),
          );
          favBlog != event.favBlog && favBlog == const Blog()
              ? emit(InitialState())
              : emit(FavoriteState(favBlog: favBlog));
        } else {
          emit(InitialState());
        }
      } catch (e) {
        log(e.toString());
        emit(ErrorState(message: e.toString()));
        throw Exception(e);
      }
    });

    on<AddToFavorites>((event, emit) async {
      log('addtofav event triggered');
      emit(LoadingState());
      try {
        final List<Blog> favBlogs = await favBlogsRepo.getFavBlogs();
        if (favBlogs.isEmpty) {
          log('favBlogs is empty');

          Fluttertoast.showToast(msg: 'Added to favorites');
          favBlogsRepo.addToFavorites(event.favBlog);

          emit(FavoriteState(favBlog: event.favBlog));
          log('emit favstate for favBlog just added');
        } else {
          log('favBlogs is not empty');
          Blog favBlog = favBlogs.firstWhere(
            (blog) => blog.id == event.favBlog.id,
            orElse: () => const Blog(),
          );
          if (favBlog != event.favBlog && favBlog == const Blog()) {
            Fluttertoast.showToast(msg: 'Added to favorites');
            favBlogsRepo.addToFavorites(event.favBlog);
            emit(FavoriteState(favBlog: event.favBlog));
            log('emit favstate for favBlog just added');
          } else {
            Fluttertoast.showToast(msg: 'Removing from favorites');
            favBlogsRepo.removeFromFavorites(favBlog);
            emit(InitialState());
            log('emit initstate for favBlog just removed from fav');
          }
        }
      } catch (e) {
        log(e.toString());
        emit(ErrorState(message: e.toString()));
        throw Exception(e);
      }
    });
  }
}
