import 'package:ecommerce/controllers/recommended_product_controller.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 60,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
            child: Container(
              child: Center(child: BigText(text: product.name!,size: 26,)),
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
            ),),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 20,right: 20),
                    child: ExpandableTextWidget(text: product.description!)
                ),
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 50, right: 50,
              top: 10, bottom: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.remove,backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,),
                BigText(text: '\$ ${product.price!} X 0', color: AppColors.mainBlackColor,
                size: 26,),
                AppIcon(icon: Icons.add,backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,iconSize: 24,),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,color: AppColors.mainColor,
                    size: 35,
                  )
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: BigText(text: '\$10 | Add to cart',color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.mainColor
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
