
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_practice/model/user_model.dart';
import 'package:flutter_mvvm_practice/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_practice/view_model/user_view_model.dart';

class SplashServices {

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async{
    getUserData().then((value) async{
      // print('token....'+value.token!);
      if(value.token == 'null' || value.token == ''){
        await Future.delayed(Duration(seconds: 3));
        // Navigator.pushNamed(context, RoutesName.login);
        Navigator.pushReplacementNamed(context, RoutesName.login);


      }else{
        await Future.delayed(Duration(seconds: 3));
        // Navigator.pushNamed(context, RoutesName.home);
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error.toString());
      }
    });
  }




}