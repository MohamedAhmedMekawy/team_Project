import 'package:untitled1/components/components.dart';
import 'package:untitled1/modules/Login/Login_Screen.dart';
import 'package:untitled1/shared/remote/cache_helper.dart';

String? token = '';
void signOut(context)
{
  CacheHelper.removeData(
    key: 'token',
  ).then((value)
  {
    if (value)
    {
      navigateAndFinish(
        context,
        LoginScreen(),
      );
    }
  });
}