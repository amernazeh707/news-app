import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newssapp/webView/WebView.dart';





Widget buildArticleItms(article, context)=> InkWell(

  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },

  child:   Padding(

    padding: const EdgeInsets.all(8.0),

    child: Row(

      children: [



        Container(

          height: 120,

          width: 120,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20),

            image: DecorationImage(

              image:NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),



        ),

        SizedBox(

          width: 15,

        ),

        Expanded(

          child: Padding(

            padding: const EdgeInsets.all(8.0),

            child: Container(

              height: 120,

              child: Column(

                crossAxisAlignment:CrossAxisAlignment.start,

                mainAxisAlignment:MainAxisAlignment.start ,

                children: [

                  Expanded(

                    child: Text('${article['title']}',

                      style:Theme.of(context).textTheme.bodyText1,



                      // TextStyle(

                      //   fontSize: 18,

                      //   fontWeight: FontWeight.w600,

                      // ),

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,

                    ),

                  ),

                  Text('${article['publishedAt']}',

                      style:TextStyle(

                        fontSize: 18,

                        color:Colors.grey,

                      )),

                ],

              ),

            ),

          ),

        )

      ],

    ),

  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);



Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItms(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,),
  fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
);
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);