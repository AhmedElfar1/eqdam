// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildSelectedIcon({
  String? image,
  String? text,
  Function? function,
  Color? color = Colors.white,
}) =>
    InkWell(
      autofocus: true,
      onTap: () {
        function!();
      },
      child: SizedBox(
        width: 110,
        child: Column(
          children: [
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                color: color,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                      width: 90, fit: BoxFit.cover, image: AssetImage(image!)),
                )),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                fontFamily: 'Cairo',
                overflow: TextOverflow.visible,
                color: Color.fromRGBO(1, 105, 135, 1),
              ),
            )
          ],
        ),
      ),
    );

Widget rowBuilder({
  String? image,
  String? text,
}) =>
    Row(
      children: [
        Card(
            color: Colors.grey[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image(
                width: 25,
                image: AssetImage(image!),
              ),
            )),
        const SizedBox(
          width: 8,
        ),
        Text(
          text!,
          overflow: TextOverflow.fade,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );

ShaderMask gradientText({
  LinearGradient? gradient,
  String? text,
  TextStyle? style,
}) =>
    ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient!.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text!,
        textAlign: TextAlign.center,
        style: style,
      ),
    );

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(text.toUpperCase(),style: TextStyle(color: Colors.cyanAccent.withOpacity(.6),fontWeight: FontWeight.bold,fontFamily: 'Cairo'),),
    );

void showToast({
  required String message,
  required ToastState state,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: chooseToastColor(state),
      fontSize: 16.0);
}

enum ToastState { SUCCESS, ERROR, WARRING }

Color chooseToastColor(ToastState state) {
  Color color;

  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARRING:
      color = Colors.amber;
      break;
  }
  return color;
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  String? Function(String?)? validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
  Function? onSubmit,
  Function? onTap,
  bool isClickable = true,
}) =>
    TextFormField(
      style: TextStyle(color: Colors.white,),
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      validator: validate,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white,),
          borderRadius: BorderRadius.circular(20)
        ),
        errorStyle: TextStyle(color: Colors.deepOrange),
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: HexColor('016987')),
            borderRadius: BorderRadius.circular(20),
        ),
        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: Colors.white,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(suffix),
          color: Colors.white,
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.white,),),
      ),
      enabled: isClickable,
    );

Widget defaultButton({
  required Function function,
  required String text,
  double width = double.infinity,
  Color backGround = Colors.white,
  bool isUpperCase = true,
  double radius = 20,
  Color color =Colors.black,
  String? image,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        borderRadius: BorderRadius.circular(radius),
        color: backGround,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Row(
          children: [
            Text(
              isUpperCase ? text.toUpperCase() : text,
              style:  TextStyle(
                color: color,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                letterSpacing: 1
              ),
            ),
            const Spacer(),
            Image(height: 25,image: AssetImage(image!),),
          ],
        ),
      ),
    );

Widget customButtonSocial ({
  required Function onPress,
  String? text,
  String? imageName,
})=>Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(11),
    color: Colors.grey.shade50,
  ),
  child: MaterialButton(
    onPressed: (){onPress;},
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      children: [
        Image.asset(imageName!),
        const SizedBox(
          width: 100,
        ),
        Text(
           text!,
        ),
      ],
    ),
  ),
);


