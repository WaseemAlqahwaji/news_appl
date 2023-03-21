import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/bloc/dashboard_cubit/dashboard_cubit.dart';
import '../../../utils/responsive.dart';
import '../../model/news.dart';
import 'news_post.dart';

class DashBoardCategory extends StatelessWidget {
  final List list;
  final int index;

  const DashBoardCategory({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardCubit object = DashboardCubit.get(context);
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              alignment: Alignment.topLeft,
              child: Text(
                object.categoryTitle[index],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0.sp,
                ),
              ),
            ),
            SizedBox(
              width: Responsive.getHeight(context),
              height: Responsive.getHeight(context) * 0.28,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return NewsPost(
                    news: News(
                      imageUrl: list[index]["urlToImage"] ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj7C90U9uTmNI4EpCsDd9JtuObcfTohaGtLA&usqp=CAU",
                      newsTitle: list[index]["title"] ?? "no title",
                      newsUrl: list[index]["url"] ?? "https://popcat.click/",
                    ),
                  );
                },
                separatorBuilder: (context, index) => Container(
                  width: 10.0.w,
                ),
                itemCount: 10,
              ),
            ),
          ],
        );
      },
    );
  }
}
