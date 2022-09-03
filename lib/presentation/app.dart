import 'package:flutter/material.dart';
import 'package:flutter_web/app/config/app_colors.dart';
import 'package:flutter_web/app/routes/routes.dart';
import 'package:flutter_web/app/routes/routes_list.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        checkboxTheme: CheckboxThemeData(
          side: MaterialStateBorderSide.resolveWith(
              (_) => BorderSide(width: 1, color: AppColors.gray300)),
          fillColor: MaterialStateProperty.all(AppColors.orange800),
          checkColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      initialRoute: RoutesList.applications,
      getPages: Routes.route,
    );
  }
}
