import 'package:flutter/material.dart';
import 'package:flutter_web/app/config/app_colors.dart';

class StatusTag extends StatelessWidget {
  final String status;
  const StatusTag({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> getColor(text) {
      switch (text) {
        case 'Published':
          return {
            "bg_color": AppColors.green50,
            "border_color": AppColors.green400
          };
        case 'Draft':
          return {
            "bg_color": AppColors.yellow50,
            "border_color": AppColors.yellow400
          };
        case 'Archived':
          return {
            "bg_color": AppColors.blue50,
            "border_color": AppColors.blue400
          };
        default:
          return {"bg_color": Colors.white, "border_color": Colors.black};
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: getColor(status)['bg_color'],
          border: Border.all(
            color: getColor(status)['border_color'],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        status,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      ),
    );
  }
}
