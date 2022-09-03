import 'package:flutter/material.dart';
import 'package:flutter_web/app/config/app_colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Row(children: [
              InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: AppColors.gray700,
                  )),
              const SizedBox(width: 10),
              Expanded(
                  child: Container(
                      color: AppColors.gray50,
                      width: 270,
                      height: 32,
                      child: const TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: OutlineInputBorder(),
                            hintText: 'Search'),
                      )))
            ]),
          ),
          const Spacer(flex: 3),
          Icon(
            Icons.notifications_outlined,
            color: AppColors.gray400,
          )
        ],
      ),
    );
  }
}
