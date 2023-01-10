// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomePressedTileAction extends HomeEvent {
  bool toRun;
  HomePressedTileAction({
    required this.toRun,
  });
}

class HomePressedProjectTile extends HomeEvent {
  HomePressedProjectTile();
}

class HomeFetchProjects extends HomeEvent {
  const HomeFetchProjects();
}
