import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timesheet/di/injector_provider.dart';
import 'package:timesheet/domain/projects_model.dart';
import 'package:timesheet/domain/repositories/projects_repository.dart';

import '../../../../domain/network_response.dart';

part 'project_detail_event.dart';
part 'project_detail_state.dart';

class ProjectDetailBloc extends Bloc<ProjectDetailEvent, ProjectDetailState> {
  final projectRepo = getIt.get<ProjectRepository>();
  ProjectDetailBloc() : super(ProjectDetailInitial()) {
    on<GetProjectDetailEvent>((event, emit) {
      _getProjectDetail(event, emit);
    });
  }

  void _getProjectDetail(
      GetProjectDetailEvent event, Emitter<ProjectDetailState> emit) async {
    var response = projectRepo.findProjectById(event.projectId);
    if (response is Success) {
      emit(state);
    } else if (response is Failure) {
      // emit(state.copy(is: false, loginError: "error"));
    } else if (response is Error) {
      // emit(state.copy(loginError: value.exception.toString()));
    }
  }
}
