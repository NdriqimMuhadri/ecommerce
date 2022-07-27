import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String text;
  final IconData icon;

  const AppTextField({Key? key, required this.textController, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1,1),
                color: Colors.grey.withOpacity(0.2)
            )
          ],
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(icon,color: AppColors.yellowColor,),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.white
              )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                width: 1.0,
                color: Colors.white
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
