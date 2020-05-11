class MercadoPagoPaymentModel {
  String id;
  String cardToken;
  double transactionAmount;
  String description;
  int installments;
  String paymentMethodId;
  Payer payer;
  String status; 
  String paymentTypeId;

  MercadoPagoPaymentModel({
    this.cardToken,
    this.transactionAmount,
    this.description,
    this.installments,
    this.paymentMethodId,
    this.payer,
  });

  MercadoPagoPaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardToken = json['token'];
    status = json['status'];
    transactionAmount = json['transaction_amount'];
    description = json['description'];
    installments = json['installments'];
    paymentTypeId = json['payment_type_id'];
    paymentMethodId = json['payment_method_id'];
    payer = json['payer'] != null ? new Payer.fromJson(json['payer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.cardToken;
    data['transaction_amount'] = this.transactionAmount;
    data['description'] = this.description;
    data['installments'] = this.installments;
    data['payment_method_id'] = this.paymentMethodId;
    if (this.payer != null) {
      data['payer'] = this.payer.toJson();
    }
    return data;
  }
}

class Payer {
  String id;
  String email;

  Payer({this.id, this.email});

  Payer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    return data;
  }
}
