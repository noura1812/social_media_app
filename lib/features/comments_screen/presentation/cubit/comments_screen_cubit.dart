import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/comments_screen/data/datasources/remote.dart';
import 'package:social_media_app/features/comments_screen/data/repositories/get_comments_data_repo.dart';
import 'package:social_media_app/features/comments_screen/domain/entities/comment_entity.dart';
import 'package:social_media_app/features/comments_screen/domain/usecases/get_comments_usecase.dart';

part 'comments_screen_state.dart';

class CommentsScreenCubit extends Cubit<CommentsScreenState> {
  List<CommentEntity> comments = [];
  CommentsScreenCubit() : super(CommentsScreenInitial());
  static CommentsScreenCubit get(context) => BlocProvider.of(context);

  getComments() async {
    emit(GetCommentsLoadingSate());

    GetCommentsDataRepo getCommentsDataRepo =
        GetCommentsDataRepo(getCommentsDataSource: Remote());
    GetCommentsUseCase getCommentsUsecase =
        GetCommentsUseCase(getCommentsDomainRepo: getCommentsDataRepo);
    var result = await getCommentsUsecase.call();
    result.fold((l) async {
      print(l);
      emit(GetCommentsFailureSate(failures: l));
    }, (r) {
      comments.addAll(r);

      emit(GetCommentsSuccessSate());
    });
  }
}
