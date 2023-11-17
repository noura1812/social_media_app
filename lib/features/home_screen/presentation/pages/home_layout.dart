import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/utils/app_colors.dart';
import 'package:social_media_app/core/utils/images.dart';
import 'package:social_media_app/features/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:social_media_app/features/home_screen/presentation/pages/tabs/home_tab.dart';
import 'package:social_media_app/features/home_screen/presentation/widgets/selected_tab_icon.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenCubit()..getPosts(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
                body: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverPadding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 0),
                          sliver: SliverAppBar(
                            bottom: PreferredSize(
                                preferredSize: const Size.fromHeight(4.0),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 0),
                                  color: AppColors.blackColor,
                                  height: 2.h,
                                )),
                            leading: Icon(
                              Icons.menu,
                              size: 40.h,
                            ),
                            actions: [
                              ImageIcon(
                                const AssetImage(LocalImages.chatIcon),
                                color: AppColors.blackColor,
                                size: 35.h,
                              ),
                              SizedBox(
                                width: 21.w,
                              )
                            ],
                            automaticallyImplyLeading: false,
                            expandedHeight: 50,
                            floating: true,
                            snap: true,
                          ),
                        )
                      ];
                    },
                    body: HomeTab()),
                bottomNavigationBar: BottomAppBar(
                  child: BottomNavigationBar(
                      showUnselectedLabels: false,
                      showSelectedLabels: true,
                      unselectedItemColor: AppColors.blackColor,
                      selectedItemColor: Colors.white,
                      elevation: 0,
                      backgroundColor: Colors.white,
                      iconSize: 25,
                      currentIndex: HomeScreenCubit.get(context).tab,
                      onTap: (value) {
                        HomeScreenCubit.get(context).changeTab(value);
                      },
                      items: [
                        BottomNavigationBarItem(
                            icon: HomeScreenCubit.get(context).tab == 0
                                ? const SelectedTabIcon(
                                    icon: Icon(
                                      Icons.home,
                                    ),
                                  )
                                : Icon(
                                    Icons.home,
                                  ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: HomeScreenCubit.get(context).tab == 1
                                ? const SelectedTabIcon(
                                    icon: Icon(
                                      Icons.search,
                                    ),
                                  )
                                : Icon(
                                    Icons.search,
                                  ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: HomeScreenCubit.get(context).tab == 2
                                ? const SelectedTabIcon(
                                    icon: Icon(
                                      Icons.favorite_border,
                                    ),
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                  ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: HomeScreenCubit.get(context).tab == 3
                                ? const SelectedTabIcon(
                                    icon: Icon(
                                      Icons.person_2_outlined,
                                    ),
                                  )
                                : Icon(
                                    Icons.person_2_outlined,
                                  ),
                            label: ''),
                      ]),
                )),
          );
        },
      ),
    );
  }
}
