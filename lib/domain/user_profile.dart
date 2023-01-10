class UserProfile {
  String? _id;
  String? _name;
  String? _email;
  String? _image;
  List<Projects>? _projects;

  UserProfile(
      {String? id,
      String? name,
      String? email,
      String? image,
      List<Projects>? projects}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (image != null) {
      this._image = image;
    }
    if (projects != null) {
      this._projects = projects;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get image => _image;
  set image(String? image) => _image = image;
  List<Projects>? get projects => _projects;
  set projects(List<Projects>? projects) => _projects = projects;

  UserProfile.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _image = json['image'];
    if (json['projects'] != null) {
      _projects = <Projects>[];
      json['projects'].forEach((v) {
        _projects!.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['image'] = this._image;
    if (this._projects != null) {
      data['projects'] = this._projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  int? _createdAt;
  int? _updatedAt;
  String? _projectId;
  int? _startedAt;
  int? _endedAt;

  Projects(
      {int? createdAt,
      int? updatedAt,
      String? projectId,
      int? startedAt,
      int? endedAt}) {
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (project != null) {
      this._projectId = projectId;
    }
    if (startedAt != null) {
      this._startedAt = startedAt;
    }
    if (endedAt != null) {
      this._endedAt = endedAt;
    }
  }

  int? get createdAt => _createdAt;
  set createdAt(int? createdAt) => _createdAt = createdAt;
  int? get updatedAt => _updatedAt;
  set updatedAt(int? updatedAt) => _updatedAt = updatedAt;
  String? get project => _projectId;
  set project(String? projectId) => _projectId = project;
  int? get startedAt => _startedAt;
  set startedAt(int? startedAt) => _startedAt = startedAt;
  int? get endedAt => _endedAt;
  set endedAt(int? endedAt) => _endedAt = endedAt;

  Projects.fromJson(Map<String, dynamic> json) {
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _projectId = json['projectId'];
    _startedAt = json['startedAt'];
    _endedAt = json['endedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    data['project'] = this._projectId;
    data['startedAt'] = this._startedAt;
    data['endedAt'] = this._endedAt;
    return data;
  }
}
