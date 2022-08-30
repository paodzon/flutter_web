import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
        checkboxTheme: CheckboxThemeData(
          side: MaterialStateBorderSide.resolveWith(
              (_) => const BorderSide(width: 1, color: Colors.grey)),
          fillColor: MaterialStateProperty.all(Colors.orange),
          checkColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      initialRoute: RoutesList.applications,
      getPages: Routes.route,
    );
  }
}
