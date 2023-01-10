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
