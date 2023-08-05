import 'package:character_viewer/pages/phone/list_screen/list_screen_page.dart';
import 'package:flutter/material.dart';

class DeviceRouterProvider {
  Map<String, Widget Function(BuildContext)> getRouter(BuildContext context) {
    return {
      ListScreenPage.routeName: (context) => const ListScreenPage(),
    };
  }
}
