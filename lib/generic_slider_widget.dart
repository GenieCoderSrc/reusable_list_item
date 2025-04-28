import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GenericSliderWidget extends StatelessWidget {
  @override
  final Key? key;
  final Widget child;
  final Widget? startPaneMotion;
  final Widget? endPaneMotion;
  final List<SlidableAction>? startActions;
  final List<SlidableAction>? endActions;

  const GenericSliderWidget({
    this.key,
    required this.child,
    this.startPaneMotion,
    this.endPaneMotion,
    this.startActions,
    this.endActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasStartActions =
        startActions != null && startActions!.isNotEmpty;
    final bool hasEndActions = endActions != null && endActions!.isNotEmpty;

    final startActionPane = hasStartActions
        ? ActionPane(
            motion: startPaneMotion ?? const ScrollMotion(),
            children: startActions!,
          )
        : null;

    final endActionPane = hasEndActions
        ? ActionPane(
            motion: endPaneMotion ?? const ScrollMotion(),
            children: endActions!,
          )
        : null;

    return Slidable(
      key: key,
      startActionPane: startActionPane,
      endActionPane: endActionPane,
      child: child,
    );
  }
}
