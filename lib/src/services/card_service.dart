import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mercado_pago_flutter/src/core/api_provider.dart';

import '../models/credentials_model.dart';
import '../models/credit_card_model.dart';

class CardService {
  MercadoPagoCredentials credentials;
  final Dio client = ApiProvider(Dio()).client();

  CardService({this.credentials});

  //cadastrar cartão
  Future<String> register({@required CreditCardModel card}) async {
    try {
      final response = await client.post(
        "v1/card_tokens?public_key=${credentials?.publicKey}",
        data: card.toJson(),
      );
      return response?.data["id"];
    } on HttpException catch (e) {
      throw Exception(e.message);
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
        data: {'token': cardToken},
      );
      return response.data;
    } on HttpException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<List<CreditCardModel>> allFromCustomer({
    @required String customerID,
  }) async {
    try {
      final response = await client.get(
        "v1/customers/$customerID/cards?access_token=${credentials?.accessToken}",
      );
      //Handle List
      List<CreditCardModel> cards = [];
      if (response?.data != null) {
        response.data.forEach((item) {
          return cards.add(CreditCardModel.fromJson(item));
        });
      }
      return cards;
    } on HttpException catch (e) {
      throw Exception(e.message);
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
    } on  HttpException catch (e) {
      throw Exception(e.message);
    }
  }
}
