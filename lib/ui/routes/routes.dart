import 'package:auto_route/annotations.dart';
import 'package:timesheet/ui/screens/home/home_screen.dart';
import 'package:timesheet/ui/screens/login/login_screen.dart';
import 'package:timesheet/ui/screens/projectDetail/project_detail_screen.dart';
import 'package:timesheet/ui/screens/registration/registration_screen.dart';

// part 'routes.gr.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: LoginScreen, path: "/login", initial: true),
  MaterialRoute(page: RegistrationScreen, path: "/registration"),
  MaterialRoute(page: HomeScreen, path: "/home"),
  MaterialRoute(page: ProjectDetailScreen, path: "/project_details"),
])
class $AppRouter {}
