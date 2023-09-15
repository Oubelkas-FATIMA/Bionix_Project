import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget GilroyText({required String text, required int size, Color color = const Color(0xFF939598)}){
  return Text(
    text,
    style: TextStyle(
      fontSize: size.sp,
      fontFamily: "Gilroy",
      color: color,
    ),
  );
}
Widget GilroyBoldText({required String text, required int size, Color color = const Color(0xFF939598)}){
  return Text(
    text,
    style: TextStyle(
      fontSize: size.sp,
      fontFamily: "GilroyBold",
      color: color,
    ),
  );
}
Widget GilroyThin({required String text, required int size, Color color = const Color(0xFF939598)}){
  return Text(
    text,
    style: TextStyle(
      fontSize: size.sp,
      fontFamily: "GilroyThin",
      color: color,
    ),
  );
}

class textBox extends StatefulWidget {
  const textBox({Key? key, required this.text, required this.icon, this.isPassword = false, required this.controller, required this.wrong}) : super(key: key);
  final String text;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  final bool wrong;
  @override
  State<textBox> createState() => _textBoxState();
}

class _textBoxState extends State<textBox> {
  Color iconColor = const Color(0xFF7d7e7e);
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (focus){
        if(focus){
          setState(() {
            iconColor = const Color(0xFF1D262D);
          });
        }else{
          setState(() {
            iconColor = const Color(0xFF7d7e7e);
          });
        }
      },
      child:  TextField(
        obscureText: widget.isPassword,
        enableSuggestions: !widget.isPassword,
        autocorrect: !widget.isPassword,
        controller: widget.controller,
        style: TextStyle(
          fontFamily: "GilroyBold",
          color: const Color(0xFF1D262D),
          fontSize: 13.sp,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: widget.wrong ? Colors.red : iconColor,),
          hintText: widget.text,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: widget.wrong ? Colors.red : const Color(0xFF7d7e7e))),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xFF1D262D))),
        ),
      ),
    );
  }
}