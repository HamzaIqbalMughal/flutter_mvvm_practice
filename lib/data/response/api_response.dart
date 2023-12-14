
import 'package:flutter_mvvm_practice/data/response/status.dart';

class ApiResponse<T> { // here we have passed the T to ApiResponse class, T could be anything.

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.complete() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString(){
    return "Status : $status \n Message: $message \n Data: $data";
  }

}