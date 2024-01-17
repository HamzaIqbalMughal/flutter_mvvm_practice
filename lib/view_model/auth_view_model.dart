

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_practice/repository/auth_repository.dart';
import 'package:flutter_mvvm_practice/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async{
    _myRepo.loginApi(data).then((value){
      Utils.flushBarErrorMessage('Login Successfully', context);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print('Error....'+error.toString());
      }
    });
  }

}