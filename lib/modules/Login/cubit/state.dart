abstract class LoginState{}
class LoginInitialState extends LoginState{}
class ShopLoginLoadingState extends LoginState{}
class ShopLoginSuccessState extends LoginState{}
class ShopChangePasswordVisibilityState extends LoginState{}
class ShopLoginErorrState extends LoginState{
  final String error;
  ShopLoginErorrState(this.error);
}