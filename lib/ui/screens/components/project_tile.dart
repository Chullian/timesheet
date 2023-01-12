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
    return GestureDetector(
      onTap: () {
        if (widget.onTileClicked != null) widget.onTileClicked!();
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 9,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Colors.cyan),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/clooney.jpg")),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.projectName ?? "",
                          style: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Inter',
                              fontSize: 15,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "London, United Kingdom",
                          style: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                              height: 1),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                iconSize: 30,
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
