import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'comments_screen_state.dart';

class CommentsScreenCubit extends Cubit<CommentsScreenState> {
  CommentsScreenCubit() : super(CommentsScreenInitial());
}
