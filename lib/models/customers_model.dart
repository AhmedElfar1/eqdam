class CustomersModel {
  String? uId;
  String? customerName;
  String? customerDis;
  String? customerSaying;
  String? customerImage;

  CustomersModel({
    this.uId,
    this.customerName,
    this.customerDis,
    this.customerSaying,
    this.customerImage,
  });

  CustomersModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    customerName = json['customerName'];
    customerDis = json['customerDis'];
    customerSaying = json['customerSaying'];
    customerImage = json['customerImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'customerName': customerName,
      'customerDis': customerDis,
      'customerSaying': customerSaying,
      'customerImage': customerImage,
    };
  }
}
