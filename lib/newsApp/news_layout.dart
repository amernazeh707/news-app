

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/Theme_cubit/theme_state.dart';
import 'package:newssapp/Theme_cubit/themecubit.dart';
import 'package:newssapp/search/search_screen.dart';
import 'package:newssapp/shared/components.dart';
import 'cubit/cubit.dart';
import 'cubit/stats.dart';



class NewsLayout extends StatelessWidget {
   NewsLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
     listener: (context,state){},
     builder: (context,state){
       var cubit = NewsCubit.get(context);
       return Scaffold(

         appBar: AppBar (
           title:Text(
             'News App',

           ),
           actions: [
             IconButton(
               icon: Icon(Icons.search),
               onPressed: (){
                 navigateTo(context , SearchScreen(),);
               },
             ),
             IconButton(
               icon: Icon(Icons.brightness_4_outlined),
               onPressed: (){
                 ThemeCubit.get(context).ChangeAppMode();

               },

             ),

           ],
         ),
         floatingActionButton:FloatingActionButton(
           onPressed: (){

           },
           child: Icon(Icons.add),
         ) ,
         body: cubit.screen[cubit.currentIndex],
         bottomNavigationBar: BottomNavigationBar(

             items: cubit.bottomItems,
           currentIndex: cubit.currentIndex,
           onTap: (index)
           {
            cubit.changeBottomNavBar(index);
           },
         ),

       );
     },
    );
  }
}
