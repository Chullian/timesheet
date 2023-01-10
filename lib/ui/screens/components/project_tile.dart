import 'package:flutter/material.dart';
import 'package:timesheet/domain/projects_model.dart';

class ProjectTile extends StatefulWidget {
  final ProjectModel project;
  final Function(bool) onChangedState;
  Function()? onTileClicked;
  ProjectTile(
      {Key? key,
      required this.project,
      required this.onChangedState,
      this.onTileClicked})
      : super(key: key);

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  late bool isProjectStateChange;
  Widget icon = const Icon(Icons.play_circle);

  @override
  void initState() {
    super.initState();
    isProjectStateChange = widget.project.projectState != "running";
  }

  void onChangedRunningState(bool isRunning) {
    isProjectStateChange = isRunning;
    widget.onChangedState(isRunning);
    if (isRunning) {
      icon = const Icon(Icons.stop_circle);
    } else {
      icon = const Icon(Icons.play_circle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 80,
      child: GestureDetector(
        onTap: () {
          if (widget.onTileClicked != null) widget.onTileClicked!();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.project.projectName ?? "",
              ),
            ),
            IconButton(
                iconSize: 40,
                onPressed: () => {
                      setState(() {
                        onChangedRunningState(!isProjectStateChange);
                      })
                    },
                icon: icon),
          ],
        ),
      ),
    );
  }
}
