import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:social_media_app/core/apis/end_points.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/core/utils/constants.dart';
import 'package:social_media_app/core/utils/images.dart';
import 'package:social_media_app/features/comments_screen/data/datasources/data_source.dart';
import 'package:social_media_app/features/comments_screen/data/models/comment_model.dart';

class Remote extends GetCommentsDataSource {
  Dio dio = Dio();

  @override
  Future<Either<Failures, List<CommentModel>>> getCommentsData() async {
    try {
      Random random = Random();
      int index = 0;

      var commentsResponce =
          await dio.get(Constants.goresBaseUrl + EndPoints.commentsEndPoint);

      List<CommentModel> comments = [];
      for (var comment in commentsResponce.data) {
        index = random.nextInt(LocalImages.usersImages.length);
        CommentModel commentModel = CommentModel.fromJson((comment));
        commentModel.image = LocalImages.usersImages[index];
        comments.add(commentModel);
      }

      return right(comments);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
