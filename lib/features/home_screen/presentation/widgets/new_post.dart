// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:social_media_app/core/utils/app_colors.dart';
import 'package:social_media_app/core/utils/text_styles.dart';
import 'package:social_media_app/core/utils/texts.dart';
import 'package:social_media_app/features/home_screen/domain/entities/user_entity.dart';

class NewPost extends StatelessWidget {
  final UserEntity userEntity;
  const NewPost({
    Key? key,
    required this.userEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 2.0.h, color: AppColors.blackColor),
            bottom: BorderSide(width: 4.0.h, color: AppColors.blackColor),
            left: BorderSide(
                width: 2.0.w,
                color: AppColors.blackColor), // Adjust the width as needed
            right: BorderSide(width: 4.0.w, color: AppColors.blackColor),
          )),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 32.r,
                  backgroundColor: AppColors.blackColor,
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage(userEntity.image ?? ''),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: Texts.shareAnything,
                        hintStyle: zillaSlab20W600()
                            .copyWith(color: AppColors.textLightColor)),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 2.h,
            width: double.infinity,
            color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 15.w),
            color: AppColors.primaryYalowColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 13.w),
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.image,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 13.w),
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 13.w),
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 30.w),
                        backgroundColor: AppColors.primaryPurpleColor,
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: AppColors.blackColor,
                            width: 2.w)),
                    onPressed: () {},
                    child: Text(
                      Texts.share,
                      style: zillaSlab20W400().copyWith(color: Colors.white),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
