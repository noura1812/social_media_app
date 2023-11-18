part of 'comments_screen_cubit.dart';

abstract class CommentsScreenState extends Equatable {
  const CommentsScreenState();

  @override
  List<Object> get props => [];
}

class CommentsScreenInitial extends CommentsScreenState {}

class GetCommentsLoadingSate extends CommentsScreenState {}

class GetCommentsSuccessSate extends CommentsScreenState {}

class GetCommentsFailureSate extends CommentsScreenState {
  final Failures failures;
  const GetCommentsFailureSate({
    required this.failures,
  });
}
