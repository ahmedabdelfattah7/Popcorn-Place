import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/layout/main_layout/controller/cubit/layout_states.dart';
import 'package:movie/layout/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie/layout/movies/presentation/screens/Movies_screen/movies_screen.dart';
import 'package:movie/layout/series/presentation/controller/series_bloc.dart';
import 'package:movie/layout/series/presentation/screens/series_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutStatesInitialStates());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.film,
      ),
      label: 'MOVIES',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.video,
      ),
      label: 'TV',
    ),
  ];
  List<Widget> screens = [
    const MainMoviesScreen(),
    const SeriesScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      sl<MoviesBloc>;
    } else if (index == 2) {
      sl<SeriesBloc>;
    }
    emit(LayoutStatesBottomNavStates());
  }
}
