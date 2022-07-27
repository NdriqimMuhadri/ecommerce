import 'package:ecommerce/widgets/account_widget.dart';
import 'package:ecommerce/widgets/app_icon.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(text: 'Profile',size: 24,color: Colors.white,),
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                AppIcon(icon: Icons.person,backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,iconSize: 75,
                size: 150,),
                SizedBox(height: 10,),
                SingleChildScrollView(
                    child: Column(
                        children: [
                          AccountWidget(appIcon: AppIcon(icon: Icons.person,backgroundColor: AppColors.mainColor,
                            iconColor: Colors.white,iconSize: 25,
                            size: 50,), bigText: BigText(text: 'Andre',)),
                          SizedBox(height: 20,),
                          AccountWidget(appIcon: AppIcon(icon: Icons.phone,backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,iconSize: 25,
                            size: 50,), bigText: BigText(text: '12312313312',)),
                          SizedBox(height: 20,),
                          AccountWidget(appIcon: AppIcon(icon: Icons.email,backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,iconSize: 25,
                            size: 50,), bigText: BigText(text: 'Andre@gmail.co',)),
                          SizedBox(height: 20,),
                          AccountWidget(appIcon: AppIcon(icon: Icons.location_on,backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,iconSize: 25,
                            size: 50,), bigText: BigText(text: 'Fill in your address',)),
                          SizedBox(height: 20,),
                          AccountWidget(appIcon: AppIcon(icon: Icons.message_outlined,backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,iconSize: 25,
                            size: 50,), bigText: BigText(text: 'Andre',)),
                        ],
                      ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
