import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timesheet/ui/components/toolbar.dart';
import 'package:timesheet/ui/screens/projectDetail/bloc/project_detail_bloc.dart';

import '../../../domain/projects_model.dart';
import '../components/project_tile.dart';
import '../components/text_fields.dart';

class ProjectDetailScreen extends StatelessWidget {
  final int projectId;
  const ProjectDetailScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    ProjectModel? project;
    return BlocProvider(
      create: ((context) => ProjectDetailBloc()
        ..add(GetProjectDetailEvent(projectId: projectId))),
      child: Scaffold(
          appBar: Toolbar(
              title: "Project Details",
              leadingAsset: "assets/icons/arrow_back.svg",
              onLeadinClicked: () => {context.router.pop()}),
          body: BlocListener<ProjectDetailBloc, ProjectDetailState>(
            listener: (context, state) {},
            child: BlocBuilder<ProjectDetailBloc, ProjectDetailState>(
              builder: (context, state) {
                project = (state.projectModel.isNotEmpty)
                    ? state.projectModel.first
                    : null;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: (project != null)
                          ? ProjectTile(
                              project: project!,
                              onChangedState: (isRunning) => {
                                context.read<ProjectDetailBloc>().add(
                                    PressedProjectTileAction(toRun: isRunning))
                              },
                            )
                          : const SizedBox(
                              height: 0,
                            ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 5, right: 10, left: 10),
                        child: Text(
                            "Click play button to start recording time now.")),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 15, right: 10, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Or, Just Schedule It!",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocBuilder<ProjectDetailBloc, ProjectDetailState>(
                              builder: (context, state) {
                                return AppTextField<ProjectDetailBloc,
                                    ProjectDetailState>(
                                  label: "Start Time",
                                  onChanged: (username, ctx) => {},
                                  readOnly: true,
                                  text: state.startDate,
                                  trailingIcon: IconButton(
                                      onPressed: () => {
                                            DatePicker.showDatePicker(context,
                                                showTitleActions: true,
                                                minTime: DateTime.now()
                                                    .subtract(
                                                        Duration(days: 2)),
                                                onChanged: (date) {
                                              context
                                                  .read<ProjectDetailBloc>()
                                                  .add(OnSelectedStartDate(
                                                      date: date
                                                          .microsecondsSinceEpoch));
                                            }, onConfirm: (date) {
                                              context
                                                  .read<ProjectDetailBloc>()
                                                  .add(OnSelectedStartDate(
                                                      date: date
                                                          .microsecondsSinceEpoch));
                                            }, currentTime: DateTime.now())
                                          },
                                      icon: SvgPicture.asset(
                                          'assets/icons/ic_calendar.svg')),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocBuilder<ProjectDetailBloc, ProjectDetailState>(
                              builder: (context, state) {
                                return AppTextField<ProjectDetailBloc,
                                        ProjectDetailState>(
                                    label: "End Time",
                                    readOnly: true,
                                    text: state.endDate,
                                    onChanged: (username, ctx) => {},
                                    trailingIcon: IconButton(
                                        onPressed: () => {
                                              DatePicker.showDatePicker(context,
                                                  showTitleActions: true,
                                                  minTime: DateTime.now()
                                                      .subtract(
                                                          Duration(days: 2)),
                                                  onChanged: (date) {
                                                context
                                                    .read<ProjectDetailBloc>()
                                                    .add(OnSelectedStartDate(
                                                        date: date
                                                            .microsecondsSinceEpoch));
                                              }, onConfirm: (date) {
                                                context
                                                    .read<ProjectDetailBloc>()
                                                    .add(OnSelectedEndDate(
                                                        date: date
                                                            .microsecondsSinceEpoch));
                                              }, currentTime: DateTime.now())
                                            },
                                        icon: SvgPicture.asset(
                                            'assets/icons/ic_calendar.svg')));
                              },
                            ),
                          ],
                        )),
                  ],
                );
              },
            ),
          )),
    );
  }
}
