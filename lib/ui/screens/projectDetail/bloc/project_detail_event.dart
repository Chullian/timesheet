part of 'project_detail_bloc.dart';

abstract class ProjectDetailEvent extends Equatable {
  const ProjectDetailEvent();

  @override
  List<Object> get props => [];
}

class GetProjectDetailEvent extends ProjectDetailEvent {
  final int projectId;
  const GetProjectDetailEvent({required this.projectId});

  @override
  List<Object> get props => [projectId];
}

class PressedProjectTileAction extends ProjectDetailEvent {
  bool toRun;
  PressedProjectTileAction({
    required this.toRun,
  });
  @override
  List<Object> get props => [toRun];
}

class OnSelectedStartDate extends ProjectDetailEvent {
  int date;
  OnSelectedStartDate({
    required this.date,
  });
  @override
  List<Object> get props => [date];
}

class OnSelectedEndDate extends ProjectDetailEvent {
  int date;
  OnSelectedEndDate({
    required this.date,
  });
  @override
  List<Object> get props => [date];
}

class PressedProjectTile extends ProjectDetailEvent {
  PressedProjectTile();
}
