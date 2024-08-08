import 'dart:convert';
import 'dart:developer';

import 'package:feature_based/data/local/local_storage.dart';

import 'package:feature_based/feature/detailed_blog/model/blog.dart';

class FavBlogsRepo {
  Future<List<Blog>> getFavBlogs() async {
    List<Blog> favBlogs = [];
    final storedFavBlogs =
        await LocalStorageService.getString(LocalStorageKeys.favBlogs);

    if (storedFavBlogs != null) {
      favBlogs = jsonDecode(storedFavBlogs)
          .map<Blog>((e) => Blog.fromJson(e))
          .toList();
    }

    return favBlogs;
  }

  removeFromFavorites(Blog blog) async {
    List<Blog> favBlogs = await getFavBlogs();
    favBlogs.remove(blog);
    await LocalStorageService.setString(
        LocalStorageKeys.favBlogs, jsonEncode(favBlogs));
    log(favBlogs.length.toString());
  }

  addToFavorites(Blog blog) async {
    List<Blog> favBlogs = await getFavBlogs();
    favBlogs.add(blog);
    await LocalStorageService.setString(
        LocalStorageKeys.favBlogs, jsonEncode(favBlogs));
    log(favBlogs.length.toString());
  }
}
