import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../src/core/api_provider.dart';

import '../models/credentials_model.dart';
import '../models/credit_card_model.dart';

class MercadoPagoCardService {
  MercadoPagoCredentials credentials;
  final Dio client = ApiProvider(Dio()).client();

  MercadoPagoCardService({this.credentials});

  //cadastrar cartão
  Future<String> register({
    @required MercadoPagoCreditCardModel card,
  }) async {
    try {
      final response = await client.post(
        "v1/card_tokens?public_key=${credentials?.publicKey}",
        data: card.toJson(),
      );
      return response?.data["id"];
    } on DioError {
      rethrow;
    }
  }

  //associar cartão com um usuario
  Future<String> associateCardWithCustomer({
    @required String customerID,
    @required String cardToken,
  }) async {
    try {
      final response = await client.post(
        "v1/card_tokens?public_key=${credentials?.publicKey}",
        data: {
          'token': cardToken,
          'customer': customerID,
        },
      );
      return response.data['id'];
    } on DioError {
      rethrow;
    }
  }

  Future<List<MercadoPagoCreditCardModel>> allFromCustomer({
    @required String customerID,
  }) async {
    try {
      final response = await client.get(
        "v1/customers/$customerID/cards?access_token=${credentials?.accessToken}",
      );
      //Handle List
      List<MercadoPagoCreditCardModel> cards = [];
      if (response?.data != null) {
        response.data.forEach((item) {
          return cards.add(MercadoPagoCreditCardModel.fromJson(item));
        });
      }
      return cards;
    } on DioError {
      rethrow;
    }
  }

  //Toda compra necessita de um token
  Future<String> token({
    @required String securityCode,
    @required String cardId,
  }) async {
    try {
      final response = await client.post(
        "/card_tokens?public_key=${credentials?.publicKey}",
        data: {
          'security_code': securityCode,
          'cardId': cardId,
        },
      );
      //TODO: handle response
      return response?.data.toString();
    } on DioError {
      rethrow;
    }
  }
}
