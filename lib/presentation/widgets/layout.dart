import 'package:flutter/material.dart';
import 'package:flutter_web/app/responsive.dart';
import 'package:flutter_web/presentation/pages/forms/views/header.dart';
import 'package:flutter_web/presentation/widgets/sidemenu.dart';

class Layout extends StatelessWidget {
  final Widget header;
  final Widget contentPage;

  const Layout({Key? key, required this.contentPage, required this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context)) const SideMenu(),
                Container(
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width - 250
                      : MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: const Color(0xffF5F5F5),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [header, contentPage],
                  )),
                ),
              ])
        ],
      ),
    );
  }
}
