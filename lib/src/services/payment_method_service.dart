import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mercado_pago_flutter/src/core/api_provider.dart';
import 'package:mercado_pago_flutter/src/models/credentials_model.dart';
import 'package:mercado_pago_flutter/src/models/payment_method_model.dart';

class MercadoPagoPaymentMethodService {
  final MercadoPagoCredentials credentials;
  final Dio client = ApiProvider(Dio()).client();

  MercadoPagoPaymentMethodService({this.credentials});

  Future<List<MercadoPagoPaymentMethodModel>> fetchAll() async {
    try {
      final response = await client.get(
        "/v1/payment_methods?public_key=${credentials?.publicKey}",
      );

      List<MercadoPagoPaymentMethodModel> methods = [];
      if (response?.data != null) {
        response.data.forEach((item) {
          return methods.add(MercadoPagoPaymentMethodModel.fromJson(item));
        });
      }
      return methods;
    } on DioError {
      rethrow;
    }
  }
}
