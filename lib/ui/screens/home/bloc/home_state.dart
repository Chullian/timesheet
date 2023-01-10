part of 'home_bloc.dart';

class HomeState extends Equatable {
  List<ProjectModel> projects;
  bool isLoading;

  HomeState({this.projects = const [], this.isLoading = false});

  HomeState copy({List<ProjectModel>? projects, bool? isLoading}) {
    var state = HomeState(
        projects: projects ?? this.projects,
        isLoading: isLoading ?? this.isLoading);
    return state;
  }

  @override
  List<Object> get props => [projects, isLoading];
}

class HomeInitial extends HomeState {}
