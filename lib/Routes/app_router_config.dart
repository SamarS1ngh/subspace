import 'package:feature_based/feature/blog_list/view/blog_list_view.dart';
import 'package:feature_based/feature/detailed_blog/model/blog.dart';
import 'package:feature_based/feature/detailed_blog/view/detailed_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return const BlogListView();
        },
        routes: [
          GoRoute(
              path: 'detailed_view',
              builder: (context, state) {
                Blog blog = state.extra! as Blog;
                return DetailedView(blog: blog);
              })
        ])
  ]);
}
