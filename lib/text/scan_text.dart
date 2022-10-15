import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled1/cubit/cubit.dart';
import 'package:untitled1/cubit/states.dart';
import 'package:untitled1/modules/asnswer/answer.dart';
import 'package:untitled1/modules/rate/rate_screen.dart';
import 'package:untitled1/style/icon_broken.dart';

class ScanText extends StatelessWidget {
  final String text;
  ScanText({
    required this.text
});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  IconBroken.Arrow___Left_2
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                       'Q:  ${text}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: MaterialButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AnswerRate(),));

                          },
                          child: Text(
                            'Show The Answer',style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          );
},
),
);
}
}
