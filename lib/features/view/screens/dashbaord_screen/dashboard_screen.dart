import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/bloc/dashboard_cubit/dashboard_cubit.dart';
import 'package:news_app/features/view/screens/news_screen/news_screen.dart';
import 'package:news_app/features/view/widgets/all_text_form.dart';
import 'package:news_app/utils/components.dart';
import 'package:news_app/utils/responsive.dart';
import '../../widgets/categorey_item.dart';
import '../../widgets/dashboard_category.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      child: const Center(
        child: CircularProgressIndicator(),
      ),
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return ConditionalBuilder(
          condition: connected,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                color: Colors.black.withOpacity(0.03),
                child: BlocConsumer<DashboardCubit, DashboardState>(
                  builder: (context, state) {
                    DashboardCubit object = DashboardCubit.get(context);
                    return ConditionalBuilder(
                      builder: (context) => Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0.h),
                            child: AllTextForm.dTextFormField(context),
                          ),
                          SizedBox(
                            width: Responsive.getWidth(context),
                            height: Responsive.getHeight(context) * 0.14,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CategoryItem(
                                index: index,
                                onPressed: () {
                                  navigateTo(
                                    context,
                                    NewsScreen(
                                      map: index == 0
                                          ? object.businessData
                                          : index == 1
                                              ? object.sportsData
                                              : index == 2
                                                  ? object.technologyData
                                                  : index == 3
                                                      ? object.healthData
                                                      : object.scienceData,
                                    ),
                                  );
                                },
                              ),
                              separatorBuilder: (context, index) => SizedBox(width: 10.0.w),
                              itemCount: 5,
                            ),
                          ),
                          DashBoardCategory(
                            list: object.businessData["articles"],
                            index: 0,
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          DashBoardCategory(
                            list: object.sportsData["articles"],
                            index: 1,
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          DashBoardCategory(
                            list: object.generalData["articles"],
                            index: 2,
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                        ],
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator()),
                      condition: object.businessData.isNotEmpty && object.generalData.isNotEmpty && object.sportsData.isNotEmpty,
                    );
                  },
                  listener: (context, state) {},
                ),
              ),
            );
          },
          fallback: (BuildContext context) {
            return Center(
              child: Text(
                "no Internet",
                style: TextStyle(
                  fontSize: 16.0.sp,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
