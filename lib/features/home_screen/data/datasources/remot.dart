import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/apis/end_points.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/core/utils/constants.dart';
import 'package:social_media_app/features/home_screen/data/datasources/data_source.dart';
import 'package:social_media_app/features/home_screen/data/models/post_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/features/home_screen/data/models/post_model.dart';
import 'package:social_media_app/features/home_screen/data/models/user_model.dart';

class Remote extends GetPostsDataSource {
  @override
  Future<Either<Failures, List<PostDataModel>>> getPostsData() async {
    try {
      Uri postsUrl = Uri.https(Constants.goresBaseUrl, EndPoints.postsEndPint);
      Uri usersUrl = Uri.https(Constants.goresBaseUrl, EndPoints.usersEndPoint);

      http.Response postsResponce = await http.get(postsUrl);
      http.Response usersResponce = await http.get(usersUrl);
      var postsJsonData = jsonDecode(postsResponce.body);
      var usersJsonData = jsonDecode(usersResponce.body);
      List<PostModel> posts = [];
      for (var post in postsJsonData) {
        posts.add(PostModel.fromJson(post));
      }
      List<UserModel> users = [];
      for (var post in usersJsonData) {
        users.add(UserModel.fromJson(post));
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
