import 'package:ecommerce/models/response_model.dart';
import 'package:ecommerce/models/signup_body_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../data/repository/auth_repo.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});


  bool _isLoading = false;
  bool get isLoading => _isLoading;

    registration(SignUpModel signUpModel)async {
    _isLoading = true;
    Response response = await authRepo.registration(signUpModel);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(response.body["token"], true);
    } else {
      responseModel = ResponseModel(response.statusText.toString(), false);
    }
  }
}