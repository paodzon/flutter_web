import 'package:flutter/material.dart';

class PaginatorButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool selected;
  final OutlinedBorder? shape;
  final Color? selectedBackgroundColor;
  final Color? unSelectedBackgroundColor;
  final Color? selectedForegroundColor;
  final Color? unSelectedforegroundColor;

  const PaginatorButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.selected = false,
    this.shape,
    this.selectedBackgroundColor,
    this.unSelectedBackgroundColor,
    this.selectedForegroundColor,
    this.unSelectedforegroundColor,
  }) : super(key: key);

  Color? _backgroundColor(BuildContext context, bool selected) => selected
      ? (selectedBackgroundColor ?? Theme.of(context).colorScheme.secondary)
      : unSelectedBackgroundColor;

  Color? _foregroundColor(BuildContext context, bool selected) => selected
      ? (selectedForegroundColor ?? Colors.white)
      : unSelectedforegroundColor;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: shape ?? const CircleBorder(),
            backgroundColor: _backgroundColor(context, selected),
            primary: _foregroundColor(context, selected),
          ),
          child: child,
        ),
      ),
    );
  }
}
