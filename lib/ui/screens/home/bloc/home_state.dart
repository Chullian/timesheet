part of 'home_bloc.dart';

class HomeState extends Equatable {
  List<ProjectModel> projects;
  bool isLoading;
  bool showApprovalBottomSheet;

  HomeState(
      {this.projects = const [],
      this.isLoading = false,
      this.showApprovalBottomSheet = false});

  HomeState copy(
      {List<ProjectModel>? projects,
      bool? isLoading,
      bool? showApprovalBottomSheet}) {
    var state = HomeState(
      projects: projects ?? this.projects,
      isLoading: isLoading ?? this.isLoading,
      showApprovalBottomSheet:
          showApprovalBottomSheet ?? this.showApprovalBottomSheet,
    );
    return state;
  }

  @override
  List<Object> get props => [projects, isLoading];
}

class HomeInitial extends HomeState {}

class HomeBottomSheet extends HomeState {}
