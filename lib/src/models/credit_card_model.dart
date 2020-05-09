import 'identification_model.dart';

class CreditCardModel {
  String securityCode;
  String expirationYear;
  String expirationMonth;
  String cardNumber;
  String lastFourDigits;
  Cardholder cardholder;

  CreditCardModel({
    this.securityCode,
    this.expirationYear,
    this.expirationMonth,
    this.cardNumber,
    this.cardholder,
    this.lastFourDigits,
  });

  CreditCardModel.fromJson(Map<String, dynamic> json) {
    
    expirationYear = json['expiration_year'];
    lastFourDigits = json['last_four_digits'];
    expirationMonth = json['expiration_month'];
    cardNumber = json['card_number'];
    cardholder = json['cardholder'] != null
        ? new Cardholder.fromJson(json['cardholder'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['security_code'] = this.securityCode;
    data['expiration_year'] = this.expirationYear;
    data['expiration_month'] = this.expirationMonth;
    data['card_number'] = this.cardNumber;
    if (this.cardholder != null) {
      data['cardholder'] = this.cardholder.toJson();
    }
    return data;
  }
}

class Cardholder {
  String name;
  IdentificationModel identification;

  Cardholder({this.name, this.identification});

  Cardholder.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    identification = json['identification'] != null
        ? new IdentificationModel.fromJson(json['identification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.identification != null) {
      data['identification'] = this.identification.toJson();
    }
    return data;
  }
}
