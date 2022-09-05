import 'package:flutter/material.dart';
import 'package:flutter_web/app/config/app_colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  )),
              Container(
                  color: AppColors.gray50,
                  width: 270,
                  height: 32,
                  child: const TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        border: OutlineInputBorder(),
                        hintText: 'Search'),
                  )),
            ],
          ),
          Icon(
            Icons.notifications_outlined,
            color: AppColors.gray400,
          )
        ],
      ),
    );
  }
}
