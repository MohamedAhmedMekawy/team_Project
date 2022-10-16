import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/cubit/cubit.dart';
import 'package:untitled1/modules/Login/Login_Screen.dart';
import 'package:untitled1/modules/home/home_screen.dart';
import 'package:untitled1/modules/splash/splash_screen.dart';
import 'package:untitled1/observer.dart';
import 'package:untitled1/shared/network/dio_helper.dart';
import 'package:untitled1/shared/remote/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => AppCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black,
                fontFamily: 'Jannah',
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            elevation: 0
          ),
            fontFamily: 'Jannah'
        ),
        home:  SplashPage(),
      ),
    );
  }
}
