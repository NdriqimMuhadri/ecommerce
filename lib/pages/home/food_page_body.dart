import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/models/products_model.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:ecommerce/widgets/app_column.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/icon_and_text_widget.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/colors.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: 320,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProducts.popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeColor: AppColors.mainColor,
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: 'Food pairing',
                ),
              ),
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommendedProducts.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(index,"home"));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        recommendedProducts
                                            .recommendedProductList[index].img),
                                    fit: BoxFit.cover,
                                  )),
                              width: 120,
                              height: 120,
                            ),
                            Expanded(
                                child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                                color: Colors.white,
                              ),
                              height: 100,
                              width: 200,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                    BigText(
                                        text: recommendedProducts
                                            .recommendedProductList[index]
                                            .name),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SmallText(
                                        text: recommendedProducts
                                            .recommendedProductList[index]
                                            .description),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: 'Normal',
                                            iconColor: AppColors.iconColor1),
                                        IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: '1.7km',
                                            iconColor: AppColors.mainColor),
                                        IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: '32min',
                                            iconColor: AppColors.iconColor2),
                                      ],
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator();
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.9;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {

            Get.toNamed(RouteHelper.getPopularFood(index,"home"));
          } ,
          child: Container(
            height: 220,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF69b5df),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        popularProduct.img!))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ]),
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: AppColumn(
                text: popularProduct.name!,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
