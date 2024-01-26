import 'dart:convert';
import 'dart:io';
import 'package:flutter_mvvm_practice/data/app_exceptions.dart';
import 'package:flutter_mvvm_practice/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiService extends BaseApiServices{

  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson ;
    try{
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson ;
    try{
      Response response = await http.post(
          Uri.parse(url),
        body: data
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse (http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
        break;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error accured while Communicating with Server, with status code '+ response.statusCode.toString());
    }
  }

}
