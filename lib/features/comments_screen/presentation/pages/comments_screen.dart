import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/reusable%20widgets/post_content.dart';
import 'package:social_media_app/core/utils/app_colors.dart';
import 'package:social_media_app/core/utils/images.dart';
import 'package:social_media_app/core/utils/text_styles.dart';
import 'package:social_media_app/core/utils/texts.dart';
import 'package:social_media_app/features/comments_screen/domain/entities/comment_screen_data.dart';
import 'package:social_media_app/features/comments_screen/presentation/cubit/comments_screen_cubit.dart';
import 'package:social_media_app/features/comments_screen/presentation/widgets/comment_card.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CommentScreenData commentScreenData =
        ModalRoute.of(context)!.settings.arguments as CommentScreenData;

    return BlocProvider(
      create: (BuildContext context) => CommentsScreenCubit()..getComments(),
      child: BlocConsumer<CommentsScreenCubit, CommentsScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetCommentsLoadingSate) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryGreenColor,
                ),
              ),
            );
          } else if (state is GetCommentsFailureSate) {
            return Scaffold(
              body: Center(
                child: Text(state.failures.toString()),
              ),
            );
          }
          return SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      'Posts',
                      style: zillaSlab26W600(),
                    ),
                    bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(4.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 0),
                          color: AppColors.blackColor,
                          height: 2.h,
                        )),
                  ),
                  body: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: AppColors.blackColor, width: 1.w)),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 20.h),
                              child: PostContent(
                                  functions: [() {}, () {}],
                                  postDataEntity: commentScreenData.post),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10.h),
                              height: 2.h,
                              width: double.infinity,
                              color: Colors.black,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: CommentsScreenCubit.get(context)
                                  .comments
                                  .length,
                              itemBuilder: (context, index) {
                                return CommentCard(
                                    comment: CommentsScreenCubit.get(context)
                                        .comments[index]);
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.h),
                              height: 2.h,
                              width: double.infinity,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28.r,
                                    backgroundColor: AppColors.blackColor,
                                    child: CircleAvatar(
                                      radius: 25.r,
                                      backgroundImage: AssetImage(
                                          commentScreenData.currentUser.image ??
                                              ''),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      autofocus: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: Texts.addComment,
                                          hintStyle: zillaSlab20W600().copyWith(
                                              color: AppColors.textLightColor)),
                                    ),
                                  ),
                                  ImageIcon(
                                    const AssetImage(LocalImages.sendIcon),
                                    color: AppColors.primaryPurpleColor,
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                  )));
        },
      ),
    );
  }
}
