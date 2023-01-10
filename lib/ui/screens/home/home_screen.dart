import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesheet/ui/screens/components/project_tile.dart';
import 'package:timesheet/ui/screens/projectDetail/project_detail_screen.dart';

import '../../routes/routes.gr.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<int> colorCodes = <int>[
      600,
      500,
      100,
      700,
      400,
      200,
      300,
      900,
      800,
      1000
    ];
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        body: Column(
          children: [
            const Text("Projects"),
            BlocListener<HomeBloc, HomeState>(
              listener: (context, state) {
                print("state changed....");
              },
              child: _projectList(),
            )
          ],
        ),
      ),
    );
  }
}

class _projectList extends StatelessWidget {
  const _projectList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(const HomeFetchProjects());
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(8),
              clipBehavior: Clip.none,
              itemCount: state.projects.length,
              itemBuilder: (BuildContext context, int index) {
                var element = state.projects.elementAt(index);
                return ProjectTile(
                  project: element,
                  onChangedState: (isRunning) => {
                    context
                        .read<HomeBloc>()
                        .add(HomePressedTileAction(toRun: isRunning))
                  },
                  onTileClicked: () {
                    if (element.projectId != null) {
                      context.router.navigate(ProjectDetailScreenRoute(
                          projectId: element.projectId!));
                    }
                  },
                );
              }),
        );
      },
    );
  }
}
