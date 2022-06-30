import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/pages/home/main_food_page.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:ecommerce/widgets/app_column.dart';
import 'package:ecommerce/widgets/app_icon.dart';
import 'package:ecommerce/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                      )
                ),
                ),
              )),
          Positioned(
              left: 20,
              right: 20,
              top: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      child: const AppIcon(icon: Icons.arrow_back_ios),
                  onTap: (){
                        Get.to(()=>const MainFoodPage());
                  },),
                  const AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: 300,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    const SizedBox(height: 20,),
                    BigText(text: 'Introduce'),
                    const SizedBox(height: 20,),
                    Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(text: product.description!)),
                    )
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) {
          return Container(
            height: 120,
            padding: const EdgeInsets.only(top: 30,bottom: 30,left: 20,right: 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
              ),
              color: AppColors.buttonBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          child: Icon(Icons.remove,color: AppColors.signColor,),
                        onTap: (){
                          popularProduct.setQuantity(false);
                        },
                      ),
                      const SizedBox(width: 5,),
                      BigText(text: popularProduct.inCartItems.toString()),
                      const SizedBox(width: 5,),
                      GestureDetector(
                          child: Icon(Icons.add,color: AppColors.signColor,),
                        onTap: (){
                          popularProduct.setQuantity(true);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                      child: BigText(text: '\$ ${product.price!} | Add to cart',color: Colors.white,),
                    onTap: (){
                        popularProduct.addItem(product);
                    },
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.mainColor
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
