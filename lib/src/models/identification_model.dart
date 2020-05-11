class MercadoPagoIdentificationModel {
  String type; //Tipo de documento
  String number; //Número do documento
  String documentName;

  MercadoPagoIdentificationModel({this.type, this.number});

  MercadoPagoIdentificationModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    number = json['number'];
    documentName = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['number'] = this.number;
    return data;
  }
}
