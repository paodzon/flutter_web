import 'package:flutter/material.dart';
import 'package:flutter_web/app/constants.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List options = sideMenuOptions;
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(30)),
                  onPressed: () => Get.toNamed(options[index]['route']),
                  child: Text(options[index]['title']));
            },
          ),
        ],
      ),
    );
  }
}
