class BaseResponse<T> {
  bool? _status;
  String? _message;
  T? _data;

  BaseResponse({bool? status, String? message, T? data}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  T? get data => _data;
  set data(T? data) => _data = data;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    data['data'] = this._data;
    return data;
  }
}
