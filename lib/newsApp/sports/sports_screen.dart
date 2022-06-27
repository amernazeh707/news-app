import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newssapp/newsApp/cubit/cubit.dart';
import 'package:newssapp/newsApp/cubit/stats.dart';
import 'package:newssapp/shared/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder:(context,state){
        var List = NewsCubit.get(context).Sports;

        return ConditionalBuilder(
          condition: List.length>0, //state is! NewsGetSportsLoodingState,
          builder:(context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildArticleItms(List[index],context),
            separatorBuilder: (context,index)=>Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20,
              ),
              child: Container(
                width:double.infinity,
                height: 1,
                color:Colors.grey[300],
              ),
            ),
            itemCount: 10,),
          fallback :(context) =>Center(child: CircularProgressIndicator(

          )),
        );
      } ,
    );
  }
}
