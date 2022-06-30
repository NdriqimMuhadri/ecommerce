import 'package:ecommerce/models/recommended_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded  => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200){
      print("got products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Recommended.fromJson(response.body).products!);
      _isLoaded = true;
      update(); // setState() lets the UI know what has been updated
    } else {

    }
  }
}