

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_practice/model/user_model.dart';
import 'package:flutter_mvvm_practice/repository/auth_repository.dart';
import 'package:flutter_mvvm_practice/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_practice/utils/utils.dart';
import 'package:flutter_mvvm_practice/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  bool _logInloading = false;
  bool get logInloading => _logInloading;

  setLogInLoading(bool value){
    _logInloading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async{
    // final userPreference = Provider.of<UserViewModel>(context);

    setLogInLoading(true);
    _myRepo.loginApi(data).then((value){

      UserModel user = UserModel.fromJson(value);

      setLogInLoading(false);
      Utils.flushBarErrorMessage('Login Successfully', context);
      Navigator.pushNamed(
          context, RoutesName.home,
        arguments: user
      );
      // userPreference.saveUser(user);
      if(kDebugMode){
        print("from AuthViewModel's loginApii() : "+value.toString());  // these print statements will only be called when the app is in debug mode.
      }
    }).onError((error, stackTrace) {
      setLogInLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString()); // these print statements will only be called when the app is in debug mode.
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async{
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then((value){

      UserModel user = UserModel.fromJson(value);

      setSignUpLoading(false);
      Utils.flushBarErrorMessage('Sign Up Successfully', context);
      Navigator.pushNamed(
          context, RoutesName.home,
          arguments: user
      );
      if(kDebugMode){
        print('--here--'+value.toString());  // these print statements will only be called when the app is in debug mode.
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString()); // these print statements will only be called when the app is in debug mode.
      }
    });
  }

}