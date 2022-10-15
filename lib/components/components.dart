import 'package:flutter/material.dart';
Widget defaultTextButton({
  required Function function,
  required String text,
}) => TextButton(
    onPressed: (){
      function();
    },
    child: Text(
      text,
    )
);
void navigateAndFinish(context, widget) =>   Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route) => false);
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  ValueChanged<String>? onSubmit,
  required Function validate,
  required IconData prefix,
  IconData? suffix,
  required String text,
  Function? suffixPressed,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  onChanged: onChange != null ? onChange() : null,
  onTap: onTap != null ? () => onTap() : null,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit,
  validator: (s){
    return validate(s);
  },
  decoration: InputDecoration(
    prefixIcon: Icon(prefix),
    border: OutlineInputBorder(),
    suffixIcon:  suffix != null ?
    IconButton(
        onPressed: (){
          suffixPressed!();
        },
        icon: Icon(suffix)
    ) : null,
    labelText: text,

  ),
);
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
Widget gradientButton({required BuildContext context,Function? onPressed,Widget? title}){
  return Container(
    clipBehavior: Clip.antiAlias,
    width: MediaQuery.of(context).size.width,
    height: 60,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          colors: [
            Colors.grey,
            Colors.blue,
            Colors.orange,
            Colors.teal,
            Colors.grey,
            Colors.pinkAccent,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
    child: MaterialButton(
      onPressed: (){
        onPressed!();
      },
      child: title,
    ),
  );
}