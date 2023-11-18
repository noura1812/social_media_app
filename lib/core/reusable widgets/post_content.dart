// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/functions/numbers_format.dart';

import 'package:social_media_app/core/utils/app_colors.dart';
import 'package:social_media_app/core/utils/images.dart';
import 'package:social_media_app/core/utils/text_styles.dart';
import 'package:social_media_app/features/home_screen/domain/entities/post_data_entity.dart';
import 'package:social_media_app/features/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:social_media_app/features/home_screen/presentation/widgets/expandble_text.dart';

class PostContent extends StatelessWidget {
  final PostDataEntity postDataEntity;
  final List<Function> functions;
  const PostContent({
    required this.functions,
    Key? key,
    required this.postDataEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32.r,
                  backgroundColor: AppColors.blackColor,
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundImage:
                        AssetImage(postDataEntity.userDataEntity.image ?? ''),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 240.w,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      postDataEntity.userDataEntity.name ?? '',
                      style: zillaSlab22W600(),
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.more_vert)
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: ShowMoreTextWidget(
                text: postDataEntity.postDataEntity.body ?? '',
                style: zillaSlab20W500(),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    HomeScreenCubit.get(context).like(postDataEntity);
                  },
                  child: postDataEntity.postDataEntity.like
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 40.h,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: AppColors.blackColor,
                          size: 40.h,
                        ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {
                    functions[0]();
                  },
                  child: ImageIcon(
                    const AssetImage(LocalImages.commentsIcon),
                    color: AppColors.blackColor,
                    size: 35.h,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                ImageIcon(
                  const AssetImage(LocalImages.sendIcon),
                  color: AppColors.blackColor,
                  size: 35.h,
                ),
                const Spacer(),
                Icon(
                  Icons.bookmark_border,
                  color: AppColors.blackColor,
                  size: 40.h,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 5.h),
              child: Text(
                '${numbersFormat(postDataEntity.postDataEntity.likes)} likes',
                style: zillaSlab16W600(),
              ),
            )
          ],
        );
      },
    );
  }
}
