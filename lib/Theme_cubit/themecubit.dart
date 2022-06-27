import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/Theme_cubit/theme_state.dart';
import 'package:newssapp/network/local/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeState>
{
  ThemeCubit(): super(NewssInitialState());
  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void ChangeAppMode({bool? fromShared}){
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(NewssAppChangeModeState());
    }
    else{
      isDark =! isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewssAppChangeModeState());
      });
    }



  }



}
