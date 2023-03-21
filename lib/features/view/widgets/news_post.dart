import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/bloc/dashboard_cubit/dashboard_cubit.dart';
import 'package:news_app/features/model/news.dart';

import '../../../utils/responsive.dart';

class NewsPost extends StatelessWidget {
  final News news;

  const NewsPost({Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      builder: (context, state) {
        DashboardCubit object = DashboardCubit.get(context);
        return SizedBox(
          width: Responsive.getWidth(context) * 0.35,
          child: InkWell(
            onTap: () async {
              final Uri url = Uri.parse(news.newsUrl);
              await object.kLaunchUrl(url);
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  // Image border
                  child: SizedBox(
                    height: Responsive.getHeight(context) * 0.18,
                    width: Responsive.getWidth(context) * 0.35,
                    // Image radius
                    child: CachedNetworkImage(
                      imageUrl: news.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Text(
                  news.newsTitle,
                  style: TextStyle(
                    fontSize: 14.0.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
