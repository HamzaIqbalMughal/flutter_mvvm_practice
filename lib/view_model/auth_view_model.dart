

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_practice/repository/auth_repository.dart';
import 'package:flutter_mvvm_practice/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_practice/utils/utils.dart';

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
    setLogInLoading(true);
    _myRepo.loginApi(data).then((value){
      setLogInLoading(false);
      Utils.flushBarErrorMessage('Login Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());  // these print statements will only be called when the app is in debug mode.
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
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('Sign Up Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
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