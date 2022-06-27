
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/network/remote/dio_helper.dart';
import 'package:newssapp/newsApp/business/business_screen.dart';
import 'package:newssapp/newsApp/cubit/stats.dart';
import 'package:newssapp/newsApp/science/science_screen.dart';
import 'package:newssapp/newsApp/sports/sports_screen.dart';

import '../settings.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screen = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sports'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'science',

    ),

  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1)
      getSports();
    if (index == 2)
      getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoodingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'Country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      // print(value?.data['articles'][0]['title']) ;
      business = value?.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(
          error.toString()
      ));
    });
  }

  List<dynamic> Sports = [];

  void getSports() {
    if (Sports.length == 0) {
      emit(NewsGetSportsLoodingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'Country': 'eg',
          'category': 'Sports',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        // print(value?.data['articles'][0]['title']) ;
        Sports = value?.data['articles'];
        print(Sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(
            error.toString()
        ));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> Science = [];


  void getScience() {
    if (Science.length == 0) {
      emit(NewsGetScienceLoodingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'Country': 'eg',
          'category': 'Science',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        // print(value?.data['articles'][0]['title']) ;
        Science = value?.data['articles'];
        print(Science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(
            error.toString()
        ));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }


List<dynamic> search = [];


  void getSearch(String value) {
    {
      emit(NewsGetSearchLoodingState());
      search = [];
      DioHelper.getData(
        url: 'v2/everything',
        query: {

          'q': '$value',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        // print(value?.data['articles'][0]['title']) ;
        search = value?.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSearchErrorState(
            error.toString()
        ));
      });
    }
  }
}