import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/Login/cubit/cubit.dart';
import 'package:untitled1/modules/Login/cubit/state.dart';
import 'package:untitled1/modules/home/home_screen.dart';
import 'package:untitled1/style/icon_broken.dart';
import '../register/Register_Screen.dart';
class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
              body: Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/scan_image.jpg'
                          ),
                          Text(
                            'LOGIN',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                          Text(
                            'login now to the browse our hot offers',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[600]
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'please enter your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(),
                              labelText: 'Enter Your Email',
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'please enter your password';
                              }
                              return null;
                            },

                            obscureText: LoginCubit.get(context).isPassword,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  LoginCubit.get(context).changePasswordVisibility();
                                },
                                icon: Icon(
                                  LoginCubit.get(context).suffix,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Enter Your Password',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                          height: 50,
                          color: Colors.grey[300],
                          child: OutlinedButton(
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                print(emailController.text);
                                print(passwordController.text);
                              }
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                  'LOGIN',
                                    style: TextStyle(color: Colors.black,
                                    fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Icon(IconBroken.Login,size: 40,)
                              ],
                            ),
                          )
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?'),
                              SizedBox(
                                width: 0,
                              ),
                              TextButton(
                                  onPressed:() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          RegisterScreen()),
                                    );
                                  },
                                  child: Text('REGISTER')),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}