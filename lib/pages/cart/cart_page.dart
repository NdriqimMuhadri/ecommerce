import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:ecommerce/widgets/app_icon.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 20,
              right: 20,
              top: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: 24,
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: 24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: 24,
                  ),
                ],
              )),
          Positioned(
              top: 100,
              left: 20,
              right: 20,
              bottom: 0,
              child: Container(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            margin: const EdgeInsets.only(top: 15),
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(_cartList[index].product);
                                    if (popularIndex >= 0) {
                                      Get.toNamed(RouteHelper.getPopularFood(
                                          popularIndex, "cartpage"));
                                    } else {
                                      var recommendedIndex = Get.find<
                                              RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product);
                                      Get.toNamed(
                                          RouteHelper.getRecommendedFood(
                                              recommendedIndex, "cartpage"));
                                    }
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index].img!
                                                        .toString()))),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: cartController
                                            .getItems[index].name!,
                                        color: Colors.black54,
                                      ),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: cartController
                                                .getItems[index].price!
                                                .toString(),
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                  onTap: () {
                                                    cartController.addItem(
                                                        _cartList[index]
                                                            .product!,
                                                        -1);
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                BigText(
                                                    text: _cartList[index]
                                                        .quantity
                                                        .toString()),
                                                //popularProduct.inCartItems.toString()),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                GestureDetector(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                  onTap: () {
                                                    cartController.addItem(
                                                        _cartList[index]
                                                            .product!,
                                                        1);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          );
                        });
                  }),
                ),
              ))
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
          height: 120,
          padding:
              const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                    const SizedBox(width: 5),
                    BigText(
                        text: "\$ " + cartController.totalAmount.toString()),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  child: BigText(
                    text: 'Check out',
                    color: Colors.white,
                  ),
                  onTap: () {
                    // popularProduct.addItem(product);
                    cartController.addToHistory();
                  },
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.mainColor),
              )
            ],
          ),
        );
      }),
    );
  }


}
