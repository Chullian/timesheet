part of 'project_detail_bloc.dart';

class ProjectDetailState extends Equatable {
  List<ProjectModel> projectModel;
  String startDate;
  String endDate;
  int endTimeStamp;
  int startTimeStamp;
  ProjectDetailState(
      {this.projectModel = const [],
      this.endDate = "",
      this.startDate = "",
      this.endTimeStamp = 0,
      this.startTimeStamp = 0});

  ProjectDetailState copy(
      {List<ProjectModel>? projectModel,
      String? startDate,
      String? endDate,
      int? endTimeStamp,
      int? startTimeStamp}) {
    return ProjectDetailState(
      projectModel: projectModel ?? this.projectModel,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      endTimeStamp: endTimeStamp ?? this.endTimeStamp,
      startTimeStamp: startTimeStamp ?? this.startTimeStamp,
    );
  }

  @override
  List<Object> get props =>
      [projectModel, startDate, endDate, endTimeStamp, startTimeStamp];
}

class ProjectDetailInitial extends ProjectDetailState {}
