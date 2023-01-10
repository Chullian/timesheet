part of 'project_detail_bloc.dart';

abstract class ProjectDetailState extends Equatable {
  ProjectModel projectModel;
  ProjectDetailState({this.projectModel = ProjectModel()});

  @override
  List<Object> get props => [projectModel];
}

class ProjectDetailInitial extends ProjectDetailState {}
