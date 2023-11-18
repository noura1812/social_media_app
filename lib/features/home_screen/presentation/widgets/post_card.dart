// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:social_media_app/core/utils/app_colors.dart';
import 'package:social_media_app/core/utils/images.dart';
import 'package:social_media_app/core/utils/text_styles.dart';

import 'package:social_media_app/features/home_screen/domain/entities/post_data_entity.dart';
import 'package:social_media_app/features/home_screen/domain/entities/user_entity.dart';
import 'package:social_media_app/features/home_screen/presentation/widgets/expandble_text.dart';

class PostCard extends StatelessWidget {
  final PostDataEntity postDataEntity;
  final UserEntity currentUserEntity;
  const PostCard({
    Key? key,
    required this.postDataEntity,
    required this.currentUserEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.blackColor, width: 1.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postDataEntity.userDataEntity.name ?? '',
                      style: zillaSlab22W600(),
                    ),
                    /* Text(
                      postDataEntity.postDataEntity.title ?? '',
                      style: zillaSlab18W400().copyWith(
                          color: AppColors.textDarkColor.withOpacity(.5)),
                          maxLines: ,
                    ),*/
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: ShowMoreTextWidget(
              text: postDataEntity.postDataEntity.body ?? '',
              style: zillaSlab20W400(),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.blackColor,
                  size: 40.h,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              ImageIcon(
                const AssetImage(LocalImages.commentsIcon),
                color: AppColors.blackColor,
                size: 35.h,
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
          )
        ],
      ),
    );
  }
}
