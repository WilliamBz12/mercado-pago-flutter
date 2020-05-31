import 'package:dio/dio.dart';
import 'package:mercado_pago_flutter/src/core/api_provider.dart';
import '../models/customer_model.dart';

import '../models/credentials_model.dart';

class MercadoPagoCustomerService {
  final MercadoPagoCredentials credentials;
  final Dio client = ApiProvider(Dio()).client();

  MercadoPagoCustomerService({this.credentials});

  //Ao Criar usuario a função retorna o id
  Future<String> create({MercadoPagoCustomerModel customer}) async {
    try {
      final response = await client.post(
        "v1/customers?access_token=${credentials?.accessToken}",
        data: customer.toJson(),
      );
      return response?.data["id"];
    } on DioError {
      rethrow;
    }
  }

  //Buscar usuario pelo ID
  Future<MercadoPagoCustomerModel> fetchById({String id}) async {
    try {
      final response = await client
          .get("v1/customers/$id?access_token=${credentials?.accessToken}");
      return MercadoPagoCustomerModel.fromJson(response?.data);
    } on DioError {
      rethrow;
    }
  }
}
