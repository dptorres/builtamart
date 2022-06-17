import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../constants/constants_colors.dart';

class TabSwitch extends StatelessWidget {
  const TabSwitch({
    Key? key,
    required this.onToggle,
    required this.initialIndex,
    this.labels = const ['Tab A', 'Tab B'],
    this.totalSwitches = 2,
    this.cornerRadius = 20.0,
    this.activeFgColor = Colors.white,
    this.inactiveBgColor = Colors.grey,
    this.inactiveFgColor = Colors.white,
    this.activeBgColors =  const [[BuiltaMartColors.red], [BuiltaMartColors.green]],
  }) : super(key: key);

  final Function onToggle;
  final int initialIndex;
  final List<String> labels;
  final int totalSwitches;
  final double cornerRadius;
  final Color activeFgColor;
  final Color inactiveBgColor;
  final Color inactiveFgColor;
  final List<List<Color>> activeBgColors;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      initialLabelIndex: initialIndex,
      totalSwitches: 2,
      labels: const ['Tab A', 'Tab B'],
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      onToggle: (selectedIndex) {
        onToggle(selectedIndex);
      },
      activeBgColors: const [[BuiltaMartColors.red], [BuiltaMartColors.green]],
    );
  }
}
