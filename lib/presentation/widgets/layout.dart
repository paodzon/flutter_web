import 'package:flutter/material.dart';
import 'package:flutter_web/app/responsive.dart';
import 'package:flutter_web/presentation/pages/applications/applications_page.dart';
import 'package:flutter_web/presentation/widgets/sidemenu.dart';

class Layout extends StatelessWidget {
  final Widget contentPage;

  const Layout({Key? key, required this.contentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(children: [
          if (Responsive.isDesktop(context) || Responsive.isTablet(context))
            const Expanded(
              child: SideMenu(),
            ),
          Expanded(flex: 6, child: contentPage),
        ]),
      ),
    );
  }
}
