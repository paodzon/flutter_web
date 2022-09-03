import 'package:flutter/material.dart';
import 'package:flutter_web/app/config/app_colors.dart';

class Dropdown extends StatefulWidget {
  final List<String> values;
  final String? selected;
  final Function selectValue;

  const Dropdown(
      {Key? key,
      required this.values,
      required this.selected,
      required this.selectValue})
      : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 147,
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.gray200, width: 0)),
      child: DropdownButton<String>(
        isExpanded: true,
        value: widget.selected,
        elevation: 16,
        underline: DropdownButtonHideUnderline(child: Container()),
        onChanged: (String? newValue) {
          widget.selectValue(newValue);
        },
        items: widget.values.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
