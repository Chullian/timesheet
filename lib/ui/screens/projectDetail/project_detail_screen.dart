import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesheet/ui/screens/projectDetail/bloc/project_detail_bloc.dart';

class ProjectDetailScreen extends StatelessWidget {
  final int projectId;
  const ProjectDetailScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => ProjectDetailBloc()),
      child: Scaffold(
          body: BlocListener(
        listener: (context, state) => {},
      )),
    );
  }
}
