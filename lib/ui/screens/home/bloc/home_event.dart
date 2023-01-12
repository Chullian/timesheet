// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomePressedTileAction extends HomeEvent {
  bool toRun;
  int projectId;
  String projectName;
  HomePressedTileAction({
    required this.toRun,
    required this.projectId,
    required this.projectName,
  });
  @override
  List<Object> get props => [toRun];
}

class HomePressedProjectTile extends HomeEvent {
  const HomePressedProjectTile();
}

class HomeProjectStartStopConfirmation extends HomeEvent {
  const HomeProjectStartStopConfirmation();
}

class HomeFetchProjects extends HomeEvent {
  const HomeFetchProjects();
}
