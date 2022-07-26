import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:ecommerce/widgets/app_icon.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../utils/colors.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = Map();

    for(int i=0; i<getCartHistoryList.length; i++){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, ()=>1);
      }
    }

    List<int> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();

    var listCounter = 0;

    // for(int x =0; x<cartItemsPerOrder.length; x++){
    //   for(int y =0; y>orderTimes[x]; y++){
    //
    //   }
    // }
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            height: 100,
            padding: const EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History",color: Colors.white,),
                AppIcon(icon: Icons.shopping_cart_outlined,iconColor: AppColors.mainColor,backgroundColor: AppColors.yellowColor,)
              ],
            ),
          ),
          Expanded(child: Container(
            margin: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20
            ),
            child: MediaQuery.removePadding(context: context,
                removeTop: true,
                child: ListView(
              children: [
                for(int i =0; i<itemsPerOrder.length; i++)
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //II-Immediately invoke
                        ((){
                          DateTime parseDate = DateFormat("yyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
                          var inputDate = DateTime.parse(parseDate.toString());
                          var outputFormat = DateFormat("MM/dd/yyyy hh:mm: a");
                          var outputDate = outputFormat.format(inputDate);
                          return BigText(text: outputDate);
                        }()),
                        // BigText(text: getCartHistoryList[listCounter].time!),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(itemsPerOrder[i], (index){
                                  if(listCounter>getCartHistoryList.length){
                                    listCounter++;
                                  }
                                  // kur munet me u bo overfloww e ka lan 3 imazhe
                                  return index<=2 ? Container(
                                    height: 80,
                                    width: 80,
                                    margin: EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter].img!
                                            )
                                        )
                                    ),
                                    child: Text("HI there"),
                                  ) : Container();
                                })
                            ),
                            Container(
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SmallText(text: "Total",color: AppColors.titleColor),
                                  BigText(text: itemsPerOrder[i].toString()+" Items",color: AppColors.titleColor,),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(width: 1,color: AppColors.mainColor)
                                    ),
                                    child: SmallText(text: "one more",color: AppColors.mainColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
              ],
            )),
          ))
        ],
      ),
    );
  }
}
