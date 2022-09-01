import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'paginator_button.dart';

class NumberPaginator extends StatefulWidget {
  final int numberPages;
  final int initialPage;
  final Function(int)? onPageChange;
  final double height;
  final OutlinedBorder? buttonShape;
  final Color? buttonSelectedForegroundColor;
  final Color? buttonUnselectedForegroundColor;
  final Color? buttonSelectedBackgroundColor;
  final Color? buttonUnselectedBackgroundColor;
  final bool showPageNumbers;
  final MainAxisAlignment mainAxisAlignment;

  const NumberPaginator({
    Key? key,
    required this.numberPages,
    this.initialPage = 0,
    this.onPageChange,
    this.height = 40.0,
    this.buttonShape,
    this.buttonSelectedForegroundColor,
    this.buttonUnselectedForegroundColor,
    this.buttonSelectedBackgroundColor,
    this.buttonUnselectedBackgroundColor,
    this.showPageNumbers = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  _NumberPaginatorState createState() => _NumberPaginatorState();
}

class _NumberPaginatorState extends State<NumberPaginator> {
  late int _currentPage;
  int _availableSpots = 0;

  @override
  void initState() {
    _currentPage = widget.initialPage;
    super.initState();
  }

  double get _buttonWidth => widget.height;

  _prev() {
    setState(() {
      _currentPage--;
    });
    widget.onPageChange?.call(_currentPage);
  }

  _next() {
    setState(() {
      _currentPage++;
    });
    widget.onPageChange?.call(_currentPage);
  }

  _navigateToPage(int index) {
    setState(() {
      _currentPage = index;
    });
    widget.onPageChange?.call(index);
  }

  bool get _dotsShouldShow =>
      _availableSpots < widget.numberPages &&
      _currentPage < widget.numberPages - _availableSpots ~/ 2 - 1;

  List<Widget> _generateButtonList() {
    var shownPages = _availableSpots - 4;

    int minValue, maxValue;
    minValue = max(0, _currentPage - shownPages ~/ 2);
    maxValue = min(minValue + shownPages, widget.numberPages - 1);
    if (maxValue - minValue < shownPages) {
      minValue = (maxValue - shownPages).clamp(0, widget.numberPages - 1);
    }
    List<Widget> buttons = List.generate(
        maxValue - minValue, (index) => _buildPageButton(minValue + index));
    Row firstPage = Row(
      children: [
        _buildPageButton(0),
        _buildDots(),
      ],
    );
    if (_currentPage >= 6 && widget.numberPages > 10) {
      buttons.insert(0, firstPage);
    }
    return buttons;
  }

  Widget _buildPageButton(int index) => PaginatorButton(
        onPressed: () => _navigateToPage(index),
        selected: _selected(index),
        shape: widget.buttonShape,
        selectedForegroundColor: widget.buttonSelectedForegroundColor,
        unSelectedforegroundColor: widget.buttonUnselectedForegroundColor,
        selectedBackgroundColor: widget.buttonSelectedBackgroundColor,
        unSelectedBackgroundColor: widget.buttonUnselectedBackgroundColor,
        child:
            AutoSizeText((index + 1).toString(), maxLines: 1, minFontSize: 5),
      );

  Widget _buildDots() => AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.bottomCenter,
          decoration: ShapeDecoration(
            shape: widget.buttonShape ?? const CircleBorder(),
            color: widget.buttonUnselectedBackgroundColor,
          ),
          child: Center(
            child: Icon(
              Icons.more_horiz,
              color: widget.buttonUnselectedForegroundColor ??
                  Theme.of(context).colorScheme.secondary,
              size: 20,
            ),
          ),
        ),
      );

  bool _selected(index) => index == _currentPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: 500,
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        children: [
          PaginatorButton(
            onPressed: _currentPage > 0 ? _prev : null,
            shape: widget.buttonShape,
            selectedForegroundColor: widget.buttonSelectedForegroundColor,
            unSelectedforegroundColor: widget.buttonUnselectedForegroundColor,
            selectedBackgroundColor: widget.buttonSelectedBackgroundColor,
            unSelectedBackgroundColor: widget.buttonUnselectedBackgroundColor,
            child: const Icon(Icons.chevron_left),
          ),
          if (widget.showPageNumbers)
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  _availableSpots =
                      (constraints.maxWidth / _buttonWidth).floor();

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ..._generateButtonList(),
                      if (_dotsShouldShow) _buildDots(),
                      _buildPageButton(widget.numberPages - 1),
                    ],
                  );
                },
              ),
            ),
          PaginatorButton(
            onPressed: _currentPage < widget.numberPages - 1 ? _next : null,
            shape: widget.buttonShape,
            selectedForegroundColor: widget.buttonSelectedForegroundColor,
            unSelectedforegroundColor: widget.buttonUnselectedForegroundColor,
            selectedBackgroundColor: widget.buttonSelectedBackgroundColor,
            unSelectedBackgroundColor: widget.buttonUnselectedBackgroundColor,
            child: const Icon(Icons.chevron_right),
          )
        ],
      ),
    );
  }
}
