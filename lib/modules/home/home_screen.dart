import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/components/components.dart';
import 'package:untitled1/cubit/cubit.dart';
import 'package:untitled1/cubit/states.dart';
import 'package:untitled1/modules/change_password/change_password.dart';
import 'package:untitled1/modules/profile/profile.dart';
import 'package:untitled1/style/icon_broken.dart';
import 'package:untitled1/text/scan_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 5,
              title: const Text(
                "Please Select Image",
              ),

            ),
            drawer: NavigationDrawer(),
            body: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (!cubit.textScanning && cubit.imageFile == null)
                            Container(
                              width: 600,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300]!,
                              ),
                            ),
                          if (cubit.imageFile != null) Image.file(File(cubit.imageFile!.path)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.grey,
                                      shadowColor: Colors.grey[400],
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0)),
                                    ),
                                    onPressed: () {
                                      cubit.getImage(ImageSource.gallery);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            IconBroken.Image,
                                            size: 30,
                                          ),
                                          Text(
                                            "Gallery",
                                            style: TextStyle(
                                                fontSize: 13, color: Colors.grey[600]),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.grey,
                                      shadowColor: Colors.grey[400],
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0)),
                                    ),
                                    onPressed: () {
                                      cubit.getImage(ImageSource.camera);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            IconBroken.Camera,
                                            size: 30,
                                          ),
                                          Text(
                                            "Camera",
                                            style: TextStyle(
                                                fontSize: 13, color: Colors.grey[600]),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          gradientButton(
                            context: context,
                            title: Text(
                              'ScanText',style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ScanText(
                                text: cubit.scannedText,
                              ),
                              )
                              );
                            },

                          )
                        ],
                      )
                  ),
                )
            ),
          );
        },
    );
  }
}
 class NavigationDrawer extends StatelessWidget {
   const NavigationDrawer({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Drawer(
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Material(
               color: Colors.blue.shade700,
               child: Container(
                 padding: EdgeInsets.only(top: 24 + MediaQuery.of(context).padding.top,bottom: 24),
               child: Column(
                 children: [
                   CircleAvatar(
                     radius: 52,
                     backgroundImage: AssetImage('assets/images/scan_image.jpg'),
                   ),
                   SizedBox(
                     height: 12,
                   ),
                   Text(
                     'Mohamed Ahmed',
                     style: TextStyle(
                         fontSize: 15,
                         color: Colors.white
                     ),
                   ),
                   Text(
                     'mmekawy48@...',
                     style: TextStyle(
                         fontSize: 10,
                         color: Colors.white
                     ),
                   ),
                 ],
               ),
               ),

             ),
             buildMenuItem(context)
           ],
         ),
       ),
     );
   }
   Widget buildMenuItem(BuildContext context) => Container(
     padding: EdgeInsets.all(24),
     child: Wrap(
       runSpacing: 16,
       children: [
         ListTile(
           onTap: (){
             navigateTo(context, ProfileScreen());
           },
           leading: Icon(IconBroken.User),
           title: Text(
             'My Profile'
           ),
         ),
         Container(
           height: 30,
           width: double.infinity,
           decoration: BoxDecoration(
               color: Colors.grey[300],
               borderRadius: BorderRadius.circular(6)
           ),
           child: Row(
             children: [
               Expanded(
                 child: Text(
                     'Setting'
                 ),
               ),
               Icon(IconBroken.Arrow___Down_2)
             ],
           ),
         ),
         ListTile(
           onTap: (){
             navigateTo(context, HomeScreen());
           },
           leading: Icon(IconBroken.Home),
           title: Text(
               'Home'
           ),
         ),
         ListTile(
           onTap: (){
             navigateTo(context, ChangePassword());
             },
           leading: Icon(IconBroken.Lock),
           title: Text(
               'Change Password'
           ),
         ),
         ListTile(
           onTap: (){
           },
           leading: Icon(IconBroken.User1),
           title: Text(
               'About Us'
           ),
         ),
         SizedBox(
          height: 120,
        ),
         ListTile(
           onTap: (){
           },
           leading: Icon(IconBroken.Logout),
           title: Text(
               'SIGN OUT'
           ),
         ),
       ],
     ),
   );
 }
 