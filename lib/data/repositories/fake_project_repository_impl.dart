import 'package:timesheet/domain/network_response.dart';
import 'package:timesheet/domain/projects_model.dart';
import 'package:timesheet/domain/repositories/projects_repository.dart';
import 'package:timesheet/domain/responses/base_response.dart';
import 'package:timesheet/domain/responses/projects_response.dart';

class FakeProjectRepositoryImpl extends ProjectRepository {
  @override
  Future<NetworkResponse> fetchProjectsByUserId(int id) async {
    List<ProjectResponse> list = [
      ProjectResponse(
        projectId: 0,
        projectName: "Project 0",
        projectTeam: ["JOHN", "HAMID", "SHARIF", "SHAHARBIN", "MUZAMMIL"],
        timings: [TimingResponse(startedAt: 12345678, stoppedAt: 12345678)],
      ),
      ProjectResponse(
        projectId: 1,
        projectName: "Project 1",
        projectTeam: ["JOHN", "HAMID", "SHARIF", "SHAHARBIN", "MUZAMMIL"],
        timings: [TimingResponse(startedAt: 12345678, stoppedAt: 12345678)],
      ),
      ProjectResponse(
        projectId: 2,
        projectName: "Project 2",
        projectTeam: ["JOHN", "HAMID", "SHARIF", "SHAHARBIN", "MUZAMMIL"],
        timings: [TimingResponse(startedAt: 12345678, stoppedAt: 12345678)],
      ),
      ProjectResponse(
        projectId: 3,
        projectName: "Project 3",
        projectTeam: ["JOHN", "HAMID", "SHARIF", "SHAHARBIN", "MUZAMMIL"],
        timings: [TimingResponse(startedAt: 12345678, stoppedAt: 12345678)],
      ),
      ProjectResponse(
        projectId: 4,
        projectName: "Project 4",
        projectTeam: ["JOHN", "HAMID", "SHARIF", "SHAHARBIN", "MUZAMMIL"],
        timings: [TimingResponse(startedAt: 12345678, stoppedAt: 12345678)],
      ),
      ProjectResponse(
        projectId: 5,
        projectName: "Project 5",
        projectTeam: ["JOHN", "HAMID", "SHARIF", "SHAHARBIN", "MUZAMMIL"],
        timings: [TimingResponse(startedAt: 12345678, stoppedAt: 12345678)],
      ),
      ProjectResponse(
        projectId: 6,
        projectName: "Project 6",
        projectTeam: ["JOHN", "HAMID", "SHARIF", "SHAHARBIN", "MUZAMMIL"],
        timings: [TimingResponse(startedAt: 12345678, stoppedAt: 12345678)],
      ),
      ProjectResponse(
        projectId: 7,
        projectName: "Project 7",
        projectTeam: ["JOHN", "HAMID", "SHARIF", "SHAHARBIN", "MUZAMMIL"],
        timings: [TimingResponse(startedAt: 12345678, stoppedAt: 12345678)],
      ),
      ProjectResponse(
        projectId: 8,
        projectName: "Project 8",
        projectTeam: ["JOHN", "HAMID", "SHARIF", "SHAHARBIN", "MUZAMMIL"],
        timings: [TimingResponse(startedAt: 12345678, stoppedAt: 12345678)],
      ),
      ProjectResponse(
        projectId: 9,
        projectName: "Project 9",
        projectTeam: ["JOHN", "HAMID", "SHARIF", "SHAHARBIN", "MUZAMMIL"],
        timings: [TimingResponse(startedAt: 12345678, stoppedAt: 12345678)],
      ),
      ProjectResponse(
        projectId: 10,
        projectName: "Project 10",
        projectTeam: ["JOHN", "HAMID", "SHARIF", "SHAHARBIN", "MUZAMMIL"],
        timings: [TimingResponse(startedAt: 12345678, stoppedAt: 12345678)],
      ),
    ];
    var response = BaseResponse<List<ProjectResponse>>(
        status: true, message: "projects fetched successfully", data: list);
    return Success(successResponse: response);
  }

  @override
  Future<NetworkResponse> findProjectById(int id) async {
    NetworkResponse response = await fetchProjectsByUserId(0);
    if (response is Success) {
      List<ProjectResponse>? list =
          (response.successResponse as BaseResponse<List<ProjectResponse>>)
              .data;
      ProjectResponse? item =
          list?.where((element) => element.projectId == id).first;
      if (item != null) {
        var response = BaseResponse<ProjectResponse>(
            status: true, message: "project fetched successfully", data: item);
        return Success(successResponse: response);
      } else {
        var response = BaseResponse<Null>(
            status: true, message: "project fetched successfully", data: null);
        return Failure(failureResponse: response);
      }
    } else {
      var response = BaseResponse<Null>(
          status: true, message: "project fetched successfully", data: null);
      return Failure(failureResponse: response);
    }
  }

  @override
  Future<NetworkResponse> updateProjectRunningStatus(
      int projectId, int userId, bool isStarted) {
    // TODO: implement updateProjectRunningSta us
    throw UnimplementedError();
  }
}
