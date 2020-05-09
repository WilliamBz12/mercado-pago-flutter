import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mercado_pago_flutter/src/core/api_provider.dart';
import '../models/customer_model.dart';

import '../models/credentials_model.dart';

class CustomerService {
  final MercadoPagoCredentials credentials;
  final Dio client = ApiProvider(Dio()).client();

  CustomerService({this.credentials});

  //Ao Criar usuario a função retorna o id
  Future<String> create({CustomerModel customer}) async {
    try {
      final response = await client.post(
        "v1/customers?access_token=${credentials?.accessToken}",
        data: customer.toJson(),
      );
      return response?.data["id"];
    } on HttpException catch (e) {
      throw Exception(e.message);
    }
  }

  //Buscar usuario pelo ID
  Future<CustomerModel> fetchById({String id}) async {
    try {
      final response = await client
          .get("v1/customers/$id?access_token=${credentials?.accessToken}");
      return CustomerModel.fromJson(response?.data);
    } on HttpException catch (e) {
      throw Exception(e.message);
    }
  }
}
