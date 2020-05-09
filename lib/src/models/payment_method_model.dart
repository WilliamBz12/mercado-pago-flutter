class PaymentMethodModel {
  String id;
  String name;
  String paymentTypeId;
  String status;
  String deferredCapture;
  double maxAllowedAmount;
  double minAllowedAmount;
  int accreditationTime;

  PaymentMethodModel({
    this.id,
    this.name,
    this.paymentTypeId,
    this.status,
    this.deferredCapture,
    this.maxAllowedAmount,
    this.minAllowedAmount,
    this.accreditationTime,
  });

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    paymentTypeId = json['payment_type_id'];
    status = json['status'];
    deferredCapture = json['deferred_capture'];
    maxAllowedAmount = json['max_allowed_amount'];
    minAllowedAmount = json['min_allowed_amount'];
    accreditationTime = json['accreditation_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['payment_type_id'] = this.paymentTypeId;
    data['status'] = this.status;
    data['deferred_capture'] = this.deferredCapture;
    data['max_allowed_amount'] = this.maxAllowedAmount;
    data['min_allowed_amount'] = this.minAllowedAmount;
    data['accreditation_time'] = this.accreditationTime;
    return data;
  }
}
