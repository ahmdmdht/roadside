import 'package:flutter/material.dart';

Widget defaultButton({
  //commen use
  double width = double.infinity,
  Color background = Colors.greenAccent,
  required Function function,
  required String text,
  bool isUpperCase = true,
  double radius = 0.0,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultFormFiled({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  required Function suffixPressed,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        validator: validate,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
          ),
          //suffixIcon: suffix !=null? IconButton(
          //  onPressed:suffixPressed,
          icon: Icon(
            suffix,
          ),

          border: OutlineInputBorder(),
        ));
