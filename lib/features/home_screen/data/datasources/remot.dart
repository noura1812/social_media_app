import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:social_media_app/core/apis/end_points.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/core/utils/constants.dart';
import 'package:social_media_app/core/utils/images.dart';
import 'package:social_media_app/features/home_screen/data/datasources/data_source.dart';
import 'package:social_media_app/features/home_screen/data/models/post_data_model.dart';
import 'package:social_media_app/features/home_screen/data/models/post_model.dart';
import 'package:social_media_app/features/home_screen/data/models/user_model.dart';

class Remote extends GetPostsDataSource {
  Dio dio = Dio();

  @override
  Future<Either<Failures, List<PostDataModel>>> getPostsData() async {
    try {
      Random random = Random();
      int index = 0;

      var postsResponce =
          await dio.get(Constants.goresBaseUrl + EndPoints.postsEndPint);
      var usersResponce =
          await dio.get(Constants.goresBaseUrl + EndPoints.usersEndPoint);

      List<PostModel> posts = [];
      for (var post in postsResponce.data) {
        posts.add(PostModel.fromJson((post)));
      }
      List<UserModel> users = [];
      for (var user in usersResponce.data) {
        index = random.nextInt(LocalImages.usersImages.length);
        UserModel userModel = UserModel.fromJson((user));
        userModel.image = LocalImages.usersImages[index];
        users.add(userModel);
      }
      List<PostDataModel> postsData = [];
      for (var i = 0; i < posts.length; i++) {
        postsData.add(
            PostDataModel(postDataEntity: posts[i], userDataEntity: users[i]));
      }
      return right(postsData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
