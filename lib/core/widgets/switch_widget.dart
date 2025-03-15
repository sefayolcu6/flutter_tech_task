import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/helpers/custom_paddings.dart';

class AppSwitch extends StatefulWidget {
  final bool isActive;
  final bool Function(bool) onChanged;
  const AppSwitch({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPaddingConstant.instance.appPaddingAll2,
      child: Switch(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          focusNode: FocusNode(),
          activeTrackColor: CustomColorConstant.instance.amber,
          value: widget.isActive,
          activeColor: Colors.red,
          onChanged: widget.onChanged),
    );
  }
}
