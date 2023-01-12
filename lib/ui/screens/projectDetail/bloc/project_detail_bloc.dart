import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timesheet/data/mappings/project_response_to_model.dart';
import 'package:timesheet/di/injector_provider.dart';
import 'package:timesheet/domain/projects_model.dart';
import 'package:timesheet/domain/repositories/projects_repository.dart';
import 'package:timesheet/domain/responses/base_response.dart';
import 'package:timesheet/domain/responses/projects_response.dart';
import 'package:timesheet/utils/date_utils.dart';

import '../../../../domain/network_response.dart';

part 'project_detail_event.dart';
part 'project_detail_state.dart';

class ProjectDetailBloc extends Bloc<ProjectDetailEvent, ProjectDetailState> {
  final projectRepo = getIt.get<ProjectRepository>();
  ProjectDetailBloc() : super(ProjectDetailInitial()) {
    on<GetProjectDetailEvent>((event, emit) {
      _getProjectDetail(event, emit);
    });
    on<OnSelectedStartDate>((event, emit) {
      _updateStartTime(event, emit);
    });
    on<OnSelectedEndDate>((event, emit) {
      _updateEndTime(event, emit);
    });
  }

  void _getProjectDetail(
      GetProjectDetailEvent event, Emitter<ProjectDetailState> emit) async {
    var response = await projectRepo.findProjectById(event.projectId);
    if (response is Success) {
      ProjectResponse? responseItem =
          (response.successResponse as BaseResponse<ProjectResponse>).data;
      if (responseItem != null) {
        ProjectModel project = ProjectResponseMapper().map(responseItem);
        emit(state.copy(projectModel: [project]));
      }
    } else if (response is Failure) {
      // emit(state.copy(is: false, loginError: "error"));
    } else if (response is Error) {
      // emit(state.copy(loginError: value.exception.toString()));
    }
  }

  void _updateEndTime(
      OnSelectedEndDate event, Emitter<ProjectDetailState> emit) {
    var endDate = DateTimeUtils.timeStampToString(event.date);
    var endTimeStamp = event.date;
    emit(state.copy(endDate: endDate, endTimeStamp: endTimeStamp));
  }

  void _updateStartTime(
      OnSelectedStartDate event, Emitter<ProjectDetailState> emit) {
    var startDate = DateTimeUtils.timeStampToString(event.date);
    var startTimeStamp = event.date;
    emit(state.copy(startDate: startDate, startTimeStamp: startTimeStamp));
  }
}
