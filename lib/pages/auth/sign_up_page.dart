import 'package:ecommerce/base/show_custom_Snack_Bar.dart';
import 'package:ecommerce/models/signup_body_model.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    void _registration(){
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty){
        showCustomSnackBar("Type in your name",title: "Name");
      }else if(phone.isEmpty){
        showCustomSnackBar("Type in your phone",title: "Phone");
      }else if(email.isEmpty){
        showCustomSnackBar("Type in your email address",title: "Email");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email password",title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your email password",title: "Password");
      }else if(password.length<6){
        showCustomSnackBar("Password can not be less than six characters",title: "password");
      }else{
        SignUpModel signUpModel = SignUpModel(email: email, name: name, password: password, phone: phone);
      }
    }

    var signUpImage = ["t.png","f.png","g.png"];
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
            AppTextField(text: "Email",textController: emailController,icon: Icons.email,),
            SizedBox(height: 20,),
            AppTextField(text: "Password",textController: passwordController,icon: Icons.password_sharp,),
            SizedBox(height: 20,),
            AppTextField(text: "Name",textController: nameController,icon: Icons.person,),
            SizedBox(height: 20,),
            AppTextField(text: "Phone",textController: phoneController,icon: Icons.phone,),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                _registration();
              },
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.mainColor
                ),
                child: Center(
                  child: BigText(
                    text: "Sign up",
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            RichText(text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                text: "Have an account already?",style: TextStyle(color: Colors.grey[500],fontSize: 20))),
            SizedBox(height: 10,),
            RichText(text: TextSpan(
                text: "Use one of the following methods",style: TextStyle(color: Colors.grey[500],fontSize: 20))),
            Wrap(
              children: List.generate(signUpImage.length, (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "assets/image/"+signUpImage[index]
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
