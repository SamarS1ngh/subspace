import 'dart:convert';

import 'package:feature_based/data/local/local_storage.dart';
import 'package:feature_based/data/remote/network/api_network_constants.dart';
import 'package:feature_based/data/remote/network/network_api_service.dart';
import 'dart:developer';
import 'package:feature_based/feature/blog_list/model/blog_list_model.dart';

import '../../detailed_blog/model/blog.dart';

class BlogRepository {
  final NetworkApiService _networkApiService = NetworkApiService();
  Future<List<Blog>> getBlogs() async {
    // LocalStorageService.clearAll();
    List<Blog> blogs = [];
    final String? storedBlogs =
        await LocalStorageService.getString(LocalStorageKeys.blogs);
    if (storedBlogs != null) {
      log('Fetching from local');

      blogs =
          jsonDecode(storedBlogs).map<Blog>((e) => Blog.fromJson(e)).toList();
    } else {
      log('Fetching from remote');
      final response =
          await _networkApiService.getResponse(APINetworkConstants.baseURL);
      BlogListModel blogListModel = BlogListModel.fromJson(response);

      blogs = blogListModel.blogs;
      LocalStorageService.setString(LocalStorageKeys.blogs, jsonEncode(blogs));
    }

    return blogs;
  }
}
