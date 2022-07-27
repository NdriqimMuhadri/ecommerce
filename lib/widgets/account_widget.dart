import 'package:ecommerce/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'big_text.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;

  AccountWidget({Key? key, required this.appIcon,required this.bigText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: 20,),
          bigText
        ],
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 1
          )
        ],
        color: Colors.white,
      ),
    );
  }
}
