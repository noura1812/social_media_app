import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/home_screen/data/datasources/remot.dart';
import 'package:social_media_app/features/home_screen/data/repositories/get_posts_data_repo.dart';
import 'package:social_media_app/features/home_screen/domain/entities/post_data_entity.dart';
import 'package:social_media_app/features/home_screen/domain/entities/user_entity.dart';
import 'package:social_media_app/features/home_screen/domain/usecases/get_posts_usecase.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  List<PostDataEntity> posts = [];
  UserEntity? currentUser;
  int tab = 0;
  HomeScreenCubit() : super(HomeScreenInitial());
  static HomeScreenCubit get(context) => BlocProvider.of(context);
  getPosts() async {
    emit(GetPostsLoadingSate());
    Random random = Random();

    GetPostsDataRepo getPostsDataRepo =
        GetPostsDataRepo(getPostsDataSource: Remote());
    GetPostsUsecase getPostsUsecase =
        GetPostsUsecase(getPostsDomainRepo: getPostsDataRepo);
    var result = await getPostsUsecase.call();
    result.fold((l) async {
      print(l);
      emit(GetPostsFailureSate(failures: l));
    }, (r) {
      posts.addAll(r);

      if (currentUser == null) {
        int index = random.nextInt(r.length);
        currentUser = posts[index].userDataEntity;
      }

      emit(GetPostsSuccessSate());
    });
  }

  changeTab(int index) {
    tab = index;
    print('kkkkfkf');
    print(tab);
    switch (index) {
      case 0:
        emit(Tab0State());
      case 1:
        emit(Tab1State());
      case 2:
        emit(Tab2State());
      case 3:
        emit(Tab3State());
    }
  }
}
