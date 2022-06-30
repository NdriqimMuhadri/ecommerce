import 'package:ecommerce/models/products_model.dart';
import 'package:get/get.dart';
import '../data/repository/cart_repo.dart';
import '../models/CartModel.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    //we do this to update existing ones in the map
    if(_items.containsKey(product.id!)){
      //we update here
      _items.update(product.id!, (value) {
        return CartModel(
            id: value.id,
            name: value.name,
            img: value.img,
            price: value.price,
            quantity: value.quantity!+quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
    }else{
      //this is how you loop through map
      // _items.forEach((key, value) {
      //   print("quantity is"+value.quantity.toString());
      // });
      //we do not want to save duplicate data that are already in map, but we can not update it9:18
      _items.putIfAbsent(product.id!, () {
        return CartModel(
            id: product.id,
            name: product.name,
            img: product.img,
            price: product.price,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
    }


  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product){
    var quantity = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key == product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}
