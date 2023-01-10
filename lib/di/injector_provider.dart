import 'package:get_it/get_it.dart';
import 'package:timesheet/data/repositories/fake_project_repository_impl.dart';
import 'package:timesheet/domain/repositories/projects_repository.dart';

import '../data/repositories/fake_auth_repo_impl.dart';
import '../domain/repositories/auth_repository.dart';

final GetIt inject = GetIt.I;
GetIt getIt = GetIt.instance;

Future<void> setupInjection() async {
  inject.registerFactory<AuthRepository>(
    () => FakeAuthRepoImpl(),
  );
  inject.registerFactory<ProjectRepository>(
    () => FakeProjectRepositoryImpl(),
  );
}
