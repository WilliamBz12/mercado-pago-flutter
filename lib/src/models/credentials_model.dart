import 'package:flutter/foundation.dart';

class MercadoPagoCredentials {
  final String publicKey;
  final String accessToken;

  MercadoPagoCredentials({
    @required this.publicKey,
    @required this.accessToken,
  });
}
