import 'package:flutter/material.dart';
import 'package:photoframer/app/destinations.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      destinations: destinations.map((val) {
        return NavigationDestination(
          icon: val.outlineIcon,
          selectedIcon: val.icon,
          label: val.label,
          tooltip: val.tooltip,
        );
      }).toList(),
    );
  }
}
