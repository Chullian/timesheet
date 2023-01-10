// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'projects_response.g.dart';

@JsonSerializable()
class ProjectResponse {
  @JsonKey(name: "project_name")
  String? projectName;
  @JsonKey(name: "project_id")
  int? projectId;
  @JsonKey(name: "")
  List<TimingResponse>? timings;
  @JsonKey(name: "project_team")
  List<String>? projectTeam;
  @JsonKey(name: "created_at")
  int? createdAt;

  ProjectResponse({
    this.projectName,
    this.projectId,
    this.timings,
    this.projectTeam,
    this.createdAt,
  });

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);
}

@JsonSerializable()
class TimingResponse {
  @JsonKey(name: "started_at")
  final int? startedAt;
  @JsonKey(name: "stopped_at")
  final int? stoppedAt;
  TimingResponse({
    this.startedAt,
    this.stoppedAt,
  });

  factory TimingResponse.fromJson(Map<String, dynamic> json) =>
      _$TimingResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TimingResponseToJson(this);
}
