import 'package:ecommerce/models/response_model.dart';
import 'package:ecommerce/models/signup_body_model.dart';
import 'package:get/get.dart';
import '../data/repository/auth_repo.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});


  bool _isLoading = false;
  bool get isLoading => _isLoading;

    Future<ResponseModel> registration(SignUpModel signUpModel)async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpModel);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(response.body["token"], true);
    } else {
      responseModel = ResponseModel(response.statusText.toString(), false);
    }
    _isLoading = false;
    update();
    return responseModel;
    }

  Future<ResponseModel> login(String email, String password)async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(email,password);
    late ResponseModel responseModel;
    if(response.statusCode == 200){

      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(response.body["token"], true);
    } else {
      responseModel = ResponseModel(response.statusText.toString(), false);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) async{
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData(){
      return authRepo.clearShareData();
  }

}