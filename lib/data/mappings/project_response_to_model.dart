import 'package:timesheet/domain/projects_model.dart';
import 'package:timesheet/domain/responses/projects_response.dart';

import '../mapper/mapper.dart';

class ProjectResponseMapper extends Mapper<ProjectResponse, ProjectModel> {
  @override
  ProjectModel map(ProjectResponse response) {
    return ProjectModel(
        projectId: response.projectId,
        projectName: response.projectName,
        projectState: "",
        projectTeam: response.projectTeam);
  }

  @override
  List<ProjectModel> mapList(List<ProjectResponse> response) {
    return response
        .map((item) => ProjectModel(
            projectId: item.projectId,
            projectName: item.projectName,
            projectState: "",
            projectTeam: item.projectTeam))
        .toList();
  }
}
