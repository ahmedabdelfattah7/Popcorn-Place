import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/layout/main_layout/controller/cubit/layout_cubit.dart';
import 'package:movie/layout/main_layout/controller/cubit/layout_states.dart';
import 'package:movie/layout/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie/layout/movies/presentation/controller/bloc/movies_states.dart';
import 'package:movie/layout/movies/presentation/screens/Movies_screen/movies_screen.dart';
import 'package:movie/layout/series/presentation/screens/series_screen.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutStates>(
        builder: (context, state) {

          var cubit = LayoutCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
