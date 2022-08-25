import 'package:flutter_web/app/routes/routes.dart';
import 'package:flutter_web/presentation/pages/applications/applications_page.dart';
import 'package:flutter_web/presentation/pages/forms/forms_page.dart';
import 'package:flutter_web/presentation/pages/settings/settings_page.dart';
import 'package:flutter_web/presentation/pages/templates/templates_page.dart';
import 'package:flutter_web/presentation/pages/workflows/workflows_page.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> route = [
    GetPage(
        name: RoutesList.applications,
        page: () => const ApplicationsPage(),
        transition: Transition.noTransition),
    GetPage(
        name: RoutesList.forms,
        page: () => const FormsPage(),
        transition: Transition.noTransition),
    GetPage(
        name: RoutesList.workflows,
        page: () => const WorkflowsPage(),
        transition: Transition.noTransition),
    GetPage(
        name: RoutesList.templates,
        page: () => const TemplatesPage(),
        transition: Transition.noTransition),
    GetPage(
        name: RoutesList.settings,
        page: () => const SettingsPage(),
        transition: Transition.noTransition),
  ];
}
