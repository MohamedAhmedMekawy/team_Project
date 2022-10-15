import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/home/home_screen.dart';
import 'package:untitled1/style/icon_broken.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';


class RegisterScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: (){
                Navigator.pop(context);
              },
                  icon: Icon(
                    IconBroken.Arrow___Left_2
                  )),
            ),
            body: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                            'assets/images/scan_image.jpg'
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'REGISTER NOW',style: TextStyle(
                          fontSize: 25
                        ),
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your name';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('User Name'),
                           prefixIcon: Icon(IconBroken.User),
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: 'Enter Your Email',
                          ),
                        ),
                        SizedBox(
                          height: 10,
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

                          obscureText: RegisterCubit.get(context).isPassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(IconBroken.Lock),
                            suffixIcon: IconButton(
                              onPressed: (){
                                RegisterCubit.get(context).changePasswordVisibility();
                              },
                              icon: Icon(
                                RegisterCubit.get(context).suffix,
                              ),
                            ),
                            labelText: 'Enter Your Password',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your phone';
                            }
                          },

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Please Enter Your Phone Number',
                            prefixIcon: Icon(IconBroken.Call)
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                            height: 50,
                            color: Colors.grey[300],
                            child: OutlinedButton(
                              onPressed: (){
                            if(formKey.currentState!.validate()){
                              print(emailController.text);
                              print(passwordController.text);
                              print(nameController.text);
                              print(phoneController.text);
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                          },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'REGISTER',
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}