import 'package:flutter/material.dart';
import 'package:flutter_web/app/config/app_colors.dart';
import 'package:flutter_web/presentation/pages/forms/views/pagination/number_pagination.dart';

class Pagination extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final int pageSize;
  final int totalItems;
  final Function setCurrentPage;

  const Pagination(
      {Key? key,
      required this.totalItems,
      required this.currentPage,
      required this.pageSize,
      required this.totalPages,
      required this.setCurrentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int firstItemRange = (currentPage - 1) * pageSize + 1;
    int lastItemRange =
        currentPage == totalPages ? totalItems : pageSize * currentPage;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: NumberPaginator(
              numberPages: totalPages,
              buttonShape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              buttonUnselectedForegroundColor: AppColors.gray700,
              buttonSelectedBackgroundColor: AppColors.orange800,
              onPageChange: (int index) => setCurrentPage(index)),
        ),
        const Spacer(),
        if (totalItems != 0)
          Text('Results: $firstItemRange to $lastItemRange of $totalItems')
      ],
    );
  }
}
