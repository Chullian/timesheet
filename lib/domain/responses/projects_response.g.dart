// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) =>
    ProjectResponse(
      projectName: json['project_name'] as String?,
      projectId: json['project_id'] as int?,
      timings: (json[''] as List<dynamic>?)
          ?.map((e) => TimingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectTeam: (json['project_team'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['created_at'] as int?,
    );

Map<String, dynamic> _$ProjectResponseToJson(ProjectResponse instance) =>
    <String, dynamic>{
      'project_name': instance.projectName,
      'project_id': instance.projectId,
      '': instance.timings,
      'project_team': instance.projectTeam,
      'created_at': instance.createdAt,
    };

TimingResponse _$TimingResponseFromJson(Map<String, dynamic> json) =>
    TimingResponse(
      startedAt: json['started_at'] as int?,
      stoppedAt: json['stopped_at'] as int?,
    );

Map<String, dynamic> _$TimingResponseToJson(TimingResponse instance) =>
    <String, dynamic>{
      'started_at': instance.startedAt,
      'stopped_at': instance.stoppedAt,
    };
