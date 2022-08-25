import 'package:flutter/material.dart';
import 'package:flutter_web/app/responsive.dart';
import 'package:flutter_web/presentation/widgets/header.dart';
import 'package:flutter_web/presentation/widgets/sidemenu.dart';

class Layout extends StatelessWidget {
  final Widget contentPage;

  const Layout({Key? key, required this.contentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: Column(
        children: [
          const Expanded(flex: 0, child: Header()),
          Expanded(
            flex: 6,
            child: Row(children: [
              if (Responsive.isDesktop(context)) const SideMenu(),
              Container(
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width - 250
                    : MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: const Color(0xffF5F5F5),
                child: contentPage,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
