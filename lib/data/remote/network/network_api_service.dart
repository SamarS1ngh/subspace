import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../api_exception.dart';
import 'base_api_service.dart';
import 'network_module.dart';

class NetworkApiService implements BaseApiService {
  final Dio dio = NetworkModule().dio;
  //Overides the getResponse method from BaseApiService
  @override
  Future<Map<String, dynamic>> getResponse(String url,
      {Map<String, String>? header, Map<String, dynamic>? params}) async {
    Map<String, dynamic> responseJson;
    try {
      //makes get request with optional params
      final Response response = await dio.get(url,
          queryParameters: params, options: Options(headers: header));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Map<String, dynamic> returnResponse(Response response) {
    Map<String, dynamic> responseJson = response.data;
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return responseJson;
      case 400:
        Fluttertoast.showToast(msg: 'Bad Request. Something Went Wrong');
        throw BadRequestException(responseJson['message']);
      case 401:
      case 403:
        Fluttertoast.showToast(msg: 'Unauthorized. Please login again');
        throw UnauthorisedException(responseJson['message']);
      case 404:
        Fluttertoast.showToast(msg: 'Not Found. Something Went Wrong');
        throw UnauthorisedException(responseJson['message']);
      case 500:
      default:
        Fluttertoast.showToast(msg: 'Server Down. Something Went Wrong');
        throw FetchDataException(responseJson['message']);
    }
  }
}
