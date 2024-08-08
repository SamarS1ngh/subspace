import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:feature_based/core/widgets/app_text.dart';
import 'package:feature_based/feature/blog_list/bloc/bloc.dart';
import 'package:feature_based/feature/blog_list/bloc/blog_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/blog_events.dart';

class BlogListView extends StatelessWidget {
  const BlogListView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    context.read<BlogListBloc>().add(FetchBlogList());
    return Scaffold(
        appBar: AppBar(
          title: AppText.defaultTextBold(
            'Blogs and Articles',
            context: context,
          ),
        ),
        body: BlocBuilder<BlogListBloc, BlogListState>(
          builder: (context, state) {
            if (state is BlogListLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            } else if (state is BlogListInitial) {
              return Center(
                child: AppText.defaultTextBold(
                  'No blogs found',
                  context: context,
                  color: Colors.orange,
                ),
              );
            } else if (state is BlogListLoaded) {
              return ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () =>
                        context.go('/detailed_view', extra: state.blogs[index]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          height: size.height * 0.3,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade900,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) {
                                  log('Error loading image: $error');
                                  return const Icon(Icons.error);
                                },
                                imageUrl: state.blogs[index].image_url ??
                                    "https://cdn.mos.cms.futurecdn.net/EKx4wUezXTrh3UZDNPiT7f-1200-80.jpg",
                                fit: BoxFit.cover,
                                width: size.width,
                                fadeInDuration:
                                    const Duration(milliseconds: 300),
                                height: size.height * 0.2,
                              ),
                              AppText.subtitleDefault(
                                  state.blogs[index].title ?? "no title",
                                  size: size.height * 0.024,
                                  context: context),
                            ],
                          )),
                    ),
                  );
                },
              );
            }
            return const Center(child: Text('Something went wrong'));
          },
        ));
  }
}
