import 'package:ecommerce/data/repository/user_repo.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../models/response_model.dart';

class UserController extends GetxController{
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool _isLoading = false;
  late UserModel _userModel;
  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      _isLoading = true;
      _userModel = UserModel.fromJson(response.body);
      responseModel = ResponseModel("Successfully", true);
    } else {
      responseModel = ResponseModel(response.statusText.toString(), false);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}