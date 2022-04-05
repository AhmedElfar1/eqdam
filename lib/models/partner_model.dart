
class PartnerModel {
  String? uId;
  String? partnerName;
  String? partnerDis;
  String? partnerImage;


  PartnerModel({
    this.uId,
    this.partnerName,
    this.partnerDis,
    this.partnerImage,
  });

  PartnerModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    partnerName = json['partnerName'];
    partnerDis = json['partnerDis'];
    partnerImage = json['partnerImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'partnerName': partnerName,
      'partnerDis': partnerDis,
      'partnerImage': partnerImage,
    };
  }
}
