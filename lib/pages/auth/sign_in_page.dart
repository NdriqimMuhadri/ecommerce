import 'package:ecommerce/pages/auth/sign_up_page.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../widgets/app_text_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Container(
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage("assets/image/logo part 1.png"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello",style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold)),
                  Text("Sign into your account",style: TextStyle(fontSize: 20,color: Colors.grey[500])),
                ],
              ),
            ),
            SizedBox(height: 20,),
            AppTextField(text: "Email",textController: emailController,icon: Icons.email,),
            SizedBox(height: 20,),
            AppTextField(text: "Password",textController: passwordController,icon: Icons.password_sharp,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Container()),
                RichText(text: TextSpan(
                    text: "Sign in into your account ",style: TextStyle(color: Colors.grey[500],fontSize: 20))),
                SizedBox(width: 20,),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.mainColor
              ),
              child: Center(
                child: BigText(
                  text: "Sign in",
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10,),
            RichText(text: TextSpan(
                text: "Don\'t an account? ",style: TextStyle(color: Colors.grey[500],fontSize: 20),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fadeIn),
                  text: "Create",style: TextStyle(color: Colors.grey[500],fontSize: 20,fontWeight: FontWeight.bold),
                  children: [

                  ])
            ])),
          ],
        ),
      ),
    );
  }
}
