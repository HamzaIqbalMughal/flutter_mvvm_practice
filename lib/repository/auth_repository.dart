
import 'package:flutter_mvvm_practice/data/network/base_api_services.dart';
import 'package:flutter_mvvm_practice/data/network/network_api_service.dart';
import 'package:flutter_mvvm_practice/res/app_urls.dart';

class AuthRepository {

  // created object of BaseApiServices (which is abstract class), and initializing it with NetworkApiService class
  BaseApiServices _apiServices = NetworkApiService(); // NetworkApiService() is extending the BaseApiServices class


  Future<dynamic> loginApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrls.loginApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrls.registerApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}