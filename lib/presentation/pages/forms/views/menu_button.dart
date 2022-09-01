import 'package:flutter/material.dart';
import 'package:flutter_web/app/config/app_colors.dart';

class MenuButton extends StatelessWidget {
  final Function onDelete;

  const MenuButton({Key? key, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PopupMenuButton(
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(Icons.more_horiz, color: AppColors.gray700)),
          ),
          onSelected: (item) {},
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
                child: Row(
              children: [
                Icon(
                  Icons.inbox_outlined,
                  color: AppColors.gray400,
                ),
                const SizedBox(width: 14),
                const Text('Archive')
              ],
            )),
            PopupMenuItem(
                onTap: () => onDelete(),
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: AppColors.gray400,
                    ),
                    const SizedBox(width: 14),
                    const Text('Delete')
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
