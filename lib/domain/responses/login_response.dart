class LoginResponse {
  int? _id;
  String? _name;
  String? _email;
  String? _token;

  LoginResponse(
      {int? id, String? name, String? email, String? password, String? token}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }

    if (token != null) {
      this._token = token;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get token => _token;
  set token(String? token) => _token = token;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['token'] = this._token;
    return data;
  }
}
