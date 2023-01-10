import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timesheet/data/mappings/project_response_to_model.dart';
import 'package:timesheet/domain/network_response.dart';
import 'package:timesheet/domain/projects_model.dart';
import 'package:timesheet/domain/repositories/projects_repository.dart';
import 'package:timesheet/domain/responses/base_response.dart';
import 'package:timesheet/domain/responses/projects_response.dart';

import '../../../../di/injector_provider.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final projectRepository = getIt.get<ProjectRepository>();
  HomeBloc() : super(HomeInitial()) {
    on<HomeFetchProjects>((event, emit) {
      _fetchProjects(event, emit);
    });
    on<HomePressedTileAction>((event, emit) {});
  }

  void _fetchProjects(HomeFetchProjects event, Emitter<HomeState> emit) async {
    emit(state.copy(isLoading: false));
    var response = await projectRepository.fetchProjectsByUserId(0);
    if (response is Success) {
      var list = ProjectResponseMapper().mapList(
          (response.successResponse as BaseResponse<List<ProjectResponse>>)
                  .data ??
              []);
      emit(HomeState(projects: list));
    } else if (response is Failure) {
      // emit(state.copy(is: false, loginError: "error"));
    } else if (response is Error) {
      // emit(state.copy(loginError: value.exception.toString()));
    }
  }
}
