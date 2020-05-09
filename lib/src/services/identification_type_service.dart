import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mercado_pago_flutter/src/core/api_provider.dart';
import 'package:mercado_pago_flutter/src/models/credentials_model.dart';
import 'package:mercado_pago_flutter/src/models/identification_model.dart';

class IdentificationTypeService {
  final MercadoPagoCredentials credentials;
  final Dio client = ApiProvider(Dio()).client();

  IdentificationTypeService({this.credentials});

  Future<List<IdentificationModel>> fetchAll() async {
    try {
      final response = await client.get(
        "/v1/identification_types?public_key=${credentials?.publicKey}",
      );

      List<IdentificationModel> methods = [];
      if (response?.data != null) {
        response.data.forEach((item) {
          return methods.add(IdentificationModel.fromJson(item));
        });
      }
      return methods;
    } on HttpException catch (e) {
      throw Exception(e.message);
    }
  }
}
