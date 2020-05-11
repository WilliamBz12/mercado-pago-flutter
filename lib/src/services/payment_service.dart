import 'dart:io';

import 'package:dio/dio.dart';
import '../core/api_provider.dart';
import '../models/payment_model.dart';

import '../models/credentials_model.dart';

class MercadoPagoPaymentService {
  MercadoPagoCredentials credentials;
  final Dio client = ApiProvider(Dio()).client();

  MercadoPagoPaymentService({this.credentials});

  //efetuar pagamento
  Future<String> create({MercadoPagoPaymentModel payment}) async {
    try {
      final response = await client.post(
        "/v1/payments?access_token=${credentials?.accessToken}",
        data: payment.toJson(),
      );
      return response.data["id"];
    } on HttpException catch (e) {
      throw Exception(e.message);
    }
  }

  //BuscarPagamentos
  Future<MercadoPagoPaymentModel> fetch({String paymentID}) async {
    try {
      final response = await client.get(
        "/v1/payments/$paymentID?access_token=${credentials?.accessToken}",
      );
      return MercadoPagoPaymentModel.fromJson(response?.data);
    } on HttpException catch (e) {
      throw Exception(e.message);
    }
  }
}
