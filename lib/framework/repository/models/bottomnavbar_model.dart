import 'package:flutter/material.dart';

class BottomModel {
  final String? name;
  final Icon iconName;
  bool isSelected;
  Color? color;
  Widget body;
  int id;

  BottomModel({ required this.name, required this.iconName, required this.color, this.isSelected = false,required this.body,required this.id});
}