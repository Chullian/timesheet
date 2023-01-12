import 'dart:ffi';

class ProjectModel {
  int? _projectId;
  String? _projectName;
  String? _projectState;
  int? _createdAt;
  List<Timings>? _timings;
  List<String>? _projectTeam;

  ProjectModel({
    int? projectId,
    String? projectName,
    String? projectState,
    int? createdAt,
    List<String>? projectTeam,
    List<Timings>? timings,
  }) {
    if (projectId != null) {
      _projectId = projectId;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (projectName != null) {
      _projectName = projectName;
    }
    if (projectState != null) {
      _projectState = projectState;
    }
    if (projectTeam != null) {
      _projectTeam = projectTeam;
    }
    if (timings != null) {
      _timings = timings;
    }
  }

  int? get projectId => _projectId;
  set projectId(int? projectId) => _projectId = projectId;
  String? get projectName => _projectName;
  set projectName(String? projectName) => _projectName = projectName;
  String? get projectState => _projectState;
  set projectState(String? projectState) => _projectState = projectState;
  List<String>? get projectTeam => _projectTeam;
  set projectTeam(List<String>? projectTeam) => _projectTeam = projectTeam;
  List<Timings>? get timings => _timings;
  set timings(List<Timings>? timings) => _timings = timings;
  int? get createdAt => _createdAt;
  set createdAt(int? createdAt) => _createdAt = createdAt;

  ProjectModel.fromJson(Map<String, dynamic> json) {
    _projectId = json['projectId'];
    _projectName = json['projectName'];
    _projectState = json['projectState'];
    _projectTeam = json['projectTeam'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this._projectId;
    data['projectName'] = this._projectName;
    data['projectState'] = this._projectState;
    if (this._projectTeam != null) {
      data['projectTeam'] = this._projectTeam;
    }
    return data;
  }
}

class Timings {
  int? startedAt;
  int? stoppedAt;

  Timings({this.startedAt, this.stoppedAt});
}
