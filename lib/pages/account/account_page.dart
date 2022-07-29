import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/user_controller.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/widgets/account_widget.dart';
import 'package:ecommerce/widgets/app_icon.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: 'Profile',
            size: 24,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<UserController>(builder: (_userController) {
          return _userLoggedIn
              ? (_userController.isLoading
                  ? Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              AppIcon(
                                icon: Icons.person,
                                backgroundColor: AppColors.mainColor,
                                iconColor: Colors.white,
                                iconSize: 75,
                                size: 150,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.person,
                                          backgroundColor: AppColors.mainColor,
                                          iconColor: Colors.white,
                                          iconSize: 25,
                                          size: 40,
                                        ),
                                        bigText: BigText(
                                          text: _userController.userModel.name,
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.phone,
                                          backgroundColor:
                                              AppColors.yellowColor,
                                          iconColor: Colors.white,
                                          iconSize: 25,
                                          size: 40,
                                        ),
                                        bigText: BigText(
                                          text: _userController.userModel.phone,
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.email,
                                          backgroundColor:
                                              AppColors.yellowColor,
                                          iconColor: Colors.white,
                                          iconSize: 25,
                                          size: 40,
                                        ),
                                        bigText: BigText(
                                          text: _userController.userModel.email,
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.location_on,
                                          backgroundColor:
                                              AppColors.yellowColor,
                                          iconColor: Colors.white,
                                          iconSize: 25,
                                          size: 40,
                                        ),
                                        bigText: BigText(
                                          text: 'Fill in your address',
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.message_outlined,
                                          backgroundColor: Colors.redAccent,
                                          iconColor: Colors.white,
                                          iconSize: 25,
                                          size: 40,
                                        ),
                                        bigText: BigText(
                                          text: 'Messages',
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (
                                        Get.find<AuthController>().userLoggedIn()) {
                                          Get.find<AuthController>().clearSharedData();
                                          Get.find<CartController>().clear();
                                          Get.find<CartController>().clearCartHistory();
                                          Get.offNamed(RouteHelper.getSignInPage());
                                        }
                                      },
                                      child: AccountWidget(
                                          appIcon: AppIcon(
                                            icon: Icons.logout,
                                            backgroundColor: Colors.redAccent,
                                            iconColor: Colors.white,
                                            iconSize: 25,
                                            size: 40,
                                          ),
                                          bigText: BigText(
                                            text: 'Logout',
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Center(child: CircularProgressIndicator()))
              : Container(
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: double.maxFinite,
                              height: 200,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/image/signintocontinue.png"))),
                              child: Text("You must loggin")),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteHelper.getSignInPage());
                            },
                            child: Container(
                                width: double.maxFinite,
                                height: 60,
                                margin: EdgeInsets.only(left: 20, right: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                color: AppColors.mainColor),
                                child: Center(child: BigText(text:"Sign in",color: Colors.white,size: 20,))),
                          ),
                        ],
                      )),
                );
        }));
  }
}
