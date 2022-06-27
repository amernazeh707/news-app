//import 'package:bloc/bloc.dart';
// import 'package:fist/Layout/home_layout.dart';
// import 'package:fist/bmi_result_screen.dart';
// import 'package:fist/bmi_screen.dart';
// import 'package:fist/counter/counter_screen.dart';
// import 'package:fist/home_screen.dart';
// import 'package:fist/login_sceen.dart';
// import 'package:fist/massenger_screen.dart';
// import 'package:fist/shared/bloc_observer.dart';
// import 'package:fist/test.dart';
// import 'package:fist/users_screen.dart';
// import 'package:fist/shared/conts.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newssapp/newsApp/cubit/stats.dart';



import 'Theme_cubit/theme_state.dart';
import 'Theme_cubit/themecubit.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';
import 'newsApp/cubit/cubit.dart';
import 'newsApp/news_layout.dart';
import 'package:newssapp/shared/bloc_observer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);

 final bool? isDark;
 MyApp(this.isDark);
  NewsLayout x =NewsLayout(
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> NewsCubit()..getBusiness()..getScience(),),
        BlocProvider(create:  (BuildContext context)=> ThemeCubit()..ChangeAppMode(
    fromShared:isDark,
    ),
    )
      ],
      child: BlocConsumer<ThemeCubit,ThemeState>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp (
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              primarySwatch: Colors.deepOrange,  //looding color
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing:10,
                // backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,

                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: Colors.white,
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              textTheme:TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,  //looding color

              appBarTheme: AppBarTheme(
                titleSpacing:10,
                // backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,

                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: HexColor('333739'),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              textTheme:TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )
              ),
            ),
            themeMode: ThemeCubit.get(context).isDark? ThemeMode.dark :ThemeMode.light ,

            home :NewsLayout(),


          );
        },
      ),
    );
  }
}




//   import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:task/test.dart';
//
// void main() => runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home:test() ,
//   ));