import 'package:auto_route/annotations.dart';
import 'package:timesheet/ui/screens/home/home_screen.dart';
import 'package:timesheet/ui/screens/login/login_screen.dart';
import 'package:timesheet/ui/screens/projectDetail/project_detail_screen.dart';
import 'package:timesheet/ui/screens/registration/registration_screen.dart';

// part 'routes.gr.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(page: LoginScreen, path: "/login", initial: true),
  AutoRoute(page: RegistrationScreen, path: "/registration"),
  AutoRoute(page: HomeScreen, path: "/home"),
  AutoRoute(page: ProjectDetailScreen, path: "/project_details"),
])
class $AppRouter {}
