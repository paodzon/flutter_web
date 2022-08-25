import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration:
              BoxDecoration(border: Border.all(color: const Color(0xffEEEEEE))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'forms',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width - 250,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'My Forms',
                  style: TextStyle(fontSize: 18),
                ),
                Icon(Icons.notifications_none_outlined)
              ]),
        )
      ],
    );
  }
}
