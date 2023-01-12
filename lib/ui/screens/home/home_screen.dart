import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesheet/ui/components/toolbar.dart';
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
        body: SafeArea(
          minimum: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Welcome, sdfsdfdfsdfsf"),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://ichef.bbci.co.uk/news/976/cpsprodpb/BE03/production/_101534684_reuters_cb.jpg.webp"))),
                    )
                  ],
                ),
              ),
              BlocListener<HomeBloc, HomeState>(
                listener: (ctx, state) {},
                child: _projectList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _bottomsheet(BuildContext context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      context: context,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Looks like you need to have the approval from the supervisor, Press "
                  'Yes'
                  " to request",
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).whenComplete(() => print("Shown Bottom"));
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
          child: Material(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                clipBehavior: Clip.none,
                itemCount: state.projects.length,
                itemBuilder: (BuildContext context, int index) {
                  var element = state.projects.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ProjectTile(
                      project: element,
                      onChangedState: (isRunning) => {
                        context.read<HomeBloc>().add(HomePressedTileAction(
                            toRun: isRunning,
                            projectId: element.projectId!,
                            projectName: element.projectName!))
                      },
                      onTileClicked: () {
                        if (element.projectId != null) {
                          context.router.navigate(ProjectDetailScreenRoute(
                              projectId: element.projectId!));
                        }
                      },
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
