import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/utils/app_colors.dart';
import 'package:social_media_app/core/utils/text_styles.dart';
import 'package:social_media_app/core/utils/texts.dart';
import 'package:social_media_app/features/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:social_media_app/features/home_screen/presentation/widgets/new_post.dart';
import 'package:social_media_app/features/home_screen/presentation/widgets/post_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final listViewController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Setup the listener.
    listViewController.addListener(() {
      if (listViewController.position.atEdge) {
        bool isTop = listViewController.position.pixels == 0;
        if (!isTop) {
          HomeScreenCubit.get(context).getPosts();
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetPostsLoadingSate &&
            HomeScreenCubit.get(context).posts.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryGreenColor,
            ),
          );
        } else if (state is GetPostsFailureSate &&
            HomeScreenCubit.get(context).posts.isEmpty) {
          return Center(
            child: SizedBox(
              width: 300.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber_rounded,
                      color: AppColors.primaryPurpleColor, size: 100.h),
                  Text(
                    state.failures.toString(),
                    style: zillaSlab24W400()
                        .copyWith(color: AppColors.primaryPurpleColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return RefreshIndicator(
          color: AppColors.primaryGreenColor,
          onRefresh: () async {
            HomeScreenCubit.get(context).refresh();
          },
          child: SingleChildScrollView(
            controller: listViewController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Hi, ${HomeScreenCubit.get(context).currentUser?.name}',
                    style: zillaSlab26W600(),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    Texts.welcome,
                    style: zillaSlab20W600()
                        .copyWith(color: AppColors.blackColor.withOpacity(.5)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  NewPost(
                      userEntity: HomeScreenCubit.get(context).currentUser!),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: HomeScreenCubit.get(context).posts.length,
                    itemBuilder: (context, index) {
                      return PostCard(
                          currentUserEntity:
                              HomeScreenCubit.get(context).currentUser!,
                          postDataEntity:
                              HomeScreenCubit.get(context).posts[index]);
                    },
                  ),
                  state is GetPostsLoadingSate || state is GetPostsSuccessSate
                      ? Container()
                      : Center(
                          child: Text(
                            Texts.noMorePosts,
                            style: zillaSlab24W400().copyWith(
                                color: AppColors.blackColor.withOpacity(.5)),
                          ),
                        ),
                  state is GetPostsLoadingSate || state is GetPostsSuccessSate
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            listViewController.animateTo(0,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                          child: Center(
                            child: Text(
                              Texts.returnToTheTop,
                              style: zillaSlab24W400().copyWith(
                                  color: AppColors.primaryPurpleColor),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
