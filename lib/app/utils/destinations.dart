import 'package:flutter/material.dart';

class Destination {
  const Destination({required this.label, required this.icon, required this.outlineIcon, required this.tooltip});
  final String label;
  final Icon icon;
  final Icon outlineIcon;
  final String tooltip;
}

const List<Destination> destinations = <Destination>[
  Destination(
    label: 'Home',
    icon: Icon(Icons.home),
    outlineIcon: Icon(Icons.home_outlined),
    tooltip: "Home page for Photoframe",
  ),
  // Destination(
  //   label: 'Create',
  //   icon: Icon(Icons.add), // Modify this line
  // ),
  Destination(
    label: 'Projects',
    icon: Icon(Icons.playlist_add_check),
    outlineIcon: Icon(Icons.playlist_add_check_outlined),
    tooltip: "A collection of projects",
  ),
  Destination(
    label: 'Settings',
    icon: Icon(Icons.settings), 
    outlineIcon: Icon(Icons.settings_outlined),
    tooltip: "Configure Settings",
  ),
];
