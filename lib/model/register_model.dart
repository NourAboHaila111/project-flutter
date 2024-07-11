class Register_Model {
  bool? status;
  User? user;
  String? message;

  Register_Model({this.status, this.user, this.message});

  Register_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   if (this.user != null) {
  //     data['user'] = this.user!.toJson();
  //   }
  //   data['message'] = this.message;
  //   return data;
  // }
}

class User {
  int? id;
  String? nameEn;
  String? nameAr;
  int? roleId;
  String? email;
  String? image;
  // ignore: unnecessary_question_mark
  Null? emailVerifiedAt;
  int? wallet;
  int? approved;
  // ignore: unnecessary_question_mark
  Null? fcmToken;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.roleId,
        this.email,
        this.image,
        this.emailVerifiedAt,
        this.wallet,
        this.approved,
        this.fcmToken,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    roleId = json['role_id'];
    email = json['email'];
    image = json['image'];
    emailVerifiedAt = json['email_verified_at'];
    wallet = json['wallet'];
    approved = json['approved'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name_en'] = this.nameEn;
  //   data['name_ar'] = this.nameAr;
  //   data['role_id'] = this.roleId;
  //   data['email'] = this.email;
  //   data['image'] = this.image;
  //   data['email_verified_at'] = this.emailVerifiedAt;
  //   data['wallet'] = this.wallet;
  //   data['approved'] = this.approved;
  //   data['fcm_token'] = this.fcmToken;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}