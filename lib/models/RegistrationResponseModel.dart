class RegistrationResponseModel {
  String? name;
  String? email;
  String? avatar;
  String? password;

  RegistrationResponseModel(
      {this.name, this.email, this.avatar, this.password});

  RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['password'] = this.password;
    return data;
  }
}
