import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/bloc/dashboard_cubit/dashboard_cubit.dart';
import '../../../../utils/responsive.dart';

class NewsScreen extends StatelessWidget {
  final Map map;

  const NewsScreen({
    Key? key,
    required this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = map["articles"];
        DashboardCubit object = DashboardCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("News Screen"),
          ),
          body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(20.0.h),
                child: InkWell(
                  onTap: () async {
                    Uri url = Uri.parse(list[index]["url"]);
                    await object.kLaunchUrl(url);
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        // Image border
                        child: SizedBox(
                          height: Responsive.getHeight(context) * 0.18,
                          width: Responsive.getWidth(context) * 0.35,
                          // Image radius
                          child: ConditionalBuilder(
                            condition: list[index]["urlToImage"] != null,
                            builder: (context) => CachedNetworkImage(
                              imageUrl: list[index]["urlToImage"],
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            fallback: (context) => Image.asset(
                              'assets/images/no_image.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: Responsive.getHeight(context) * 0.18,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list[index]["title"] ?? "No Title",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                list[index]["description"] ?? "No description",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[400],
              ),
            ),
            itemCount: list.length,
          ),
        );
      },
    );
  }
}
