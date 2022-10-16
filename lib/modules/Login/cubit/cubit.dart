import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/models/login_model.dart';
import 'package:untitled1/shared/end_points.dart';
import 'package:untitled1/shared/network/dio_helper.dart';

import 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ShopChangePasswordVisibilityState());
  }

  LoginModel? loginModel;
  void userLogin({
    required String username,
    required String password,
  }){
    emit(AppLoginLoadingState());
    DioHelper.postData(url: LOGIN,
        data: {
          'username' : username,
          'password' : password
        }).then((value) {
          loginModel = LoginModel.fromJson(value.data);
          print(loginModel!.username);
      print(value.data);
      emit(AppLoginSuccessState(loginModel!));
    }).catchError((error){
      emit(AppLoginErrorState(error.toString()));
      print(error.toString());
    });
  }
}