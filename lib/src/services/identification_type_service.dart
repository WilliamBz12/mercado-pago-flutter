import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mercado_pago_flutter/src/core/api_provider.dart';
import 'package:mercado_pago_flutter/src/models/credentials_model.dart';
import 'package:mercado_pago_flutter/src/models/identification_model.dart';

class MercadoPagoIdentificationTypeService {
  final MercadoPagoCredentials credentials;
  final Dio client = ApiProvider(Dio()).client();

  MercadoPagoIdentificationTypeService({this.credentials});

  Future<List<MercadoPagoIdentificationModel>> fetchAll() async {
    try {
      final response = await client.get(
        "/v1/identification_types?public_key=${credentials?.publicKey}",
      );

      List<MercadoPagoIdentificationModel> methods = [];
      if (response?.data != null) {
        response.data.forEach((item) {
          return methods.add(MercadoPagoIdentificationModel.fromJson(item));
        });
      }
      return methods;
    } on HttpException catch (e) {
      throw Exception(e.message);
    }
  }
}
