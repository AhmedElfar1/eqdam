class UserModel
{
  String? uId;
  String? token;
  String? name;
  String? phone;
  String? email;
  String? profilePic;



  UserModel({
    this.uId,
    this.token,
    this.phone,
    this.email,
    this.name,
    this.profilePic,
  });

  UserModel.fromJson(Map<String, dynamic>? json){
    uId = json!['uId'];
    token = json['token'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toMap (){
    return {
      'uId': uId,
      'token': token,
      'name':name,
      'phone':phone,
      'email':email,
      'profilePic':profilePic,
    };
  }
}