import 'identification_model.dart';

class MercadoPagoCustomerModel {
  String id;
  String email;
  String firstName;
  String lastName;
  MercadoPagoIdentificationModel identification;

  MercadoPagoCustomerModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.identification,
  });

  MercadoPagoCustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    identification = json['identification'] != null
        ? new MercadoPagoIdentificationModel.fromJson(json['identification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.identification != null) {
      data['identification'] = this.identification.toJson();
    }
    return data;
  }
}
