import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:feature_based/feature/detailed_blog/bloc/bloc.dart';
import 'package:feature_based/feature/detailed_blog/bloc/events.dart';
import 'package:feature_based/feature/detailed_blog/bloc/states.dart';
import 'package:feature_based/feature/detailed_blog/view/widgets/add_to_fav_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/blog.dart';

class DetailedView extends StatelessWidget {
  const DetailedView({super.key, required this.blog});
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    context.read<DetailedBlogBloc>().add(FetchFavorites(favBlog: blog));
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              blog.title ?? 'No title found',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: CachedNetworkImage(
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) {
                  log('Error loading image: $error');
                  return const Icon(Icons.error);
                },
                imageUrl: blog.image_url ??
                    "https://cdn.mos.cms.futurecdn.net/EKx4wUezXTrh3UZDNPiT7f-1200-80.jpg",
                fit: BoxFit.cover,
                width: size.width,
                fadeInDuration: const Duration(milliseconds: 300),
                height: size.height * 0.3,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            BlocBuilder<DetailedBlogBloc, DetailedBlogStates>(
                builder: (context, state) {
              if (state is InitialState) {
                return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.05,
                        horizontal: size.width * 0.2),
                    child: AddToFavBtn(
                        onTap: () {
                          context
                              .read<DetailedBlogBloc>()
                              .add(AddToFavorites(favBlog: blog));
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        label: 'Add to Favorites'));
              } else if (state is FavoriteState) {
                return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.05,
                        horizontal: size.width * 0.2),
                    child: AddToFavBtn(
                        onTap: () {
                          context
                              .read<DetailedBlogBloc>()
                              .add(AddToFavorites(favBlog: blog));
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.orange,
                        ),
                        label: 'Added to Favorites'));
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
