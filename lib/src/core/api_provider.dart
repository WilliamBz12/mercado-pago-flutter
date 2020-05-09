import 'package:dio/dio.dart';

class ApiProvider {
  final Dio dio;
  ApiProvider(this.dio);

  client() {
    dio.options.baseUrl = 'https://api.mercadopago.com/';
    return dio;
  }
}
