import '../network_response.dart';

abstract class ProjectRepository {
  Future<NetworkResponse> findProjectById(int id);
  Future<NetworkResponse> fetchProjectsByUserId(int id);
  Future<NetworkResponse> updateProjectRunningStatus(
      int projectId, int userId, bool isStarted);
}
