import 'package:character_viewer/pages/phone/list_screen/list_screen_page.dart';
import 'package:character_viewer/services/character_request.dart';
import 'package:flutter/material.dart';

class DeviceRouterProvider {
  Map<String, Widget Function(BuildContext)> getRouter(
      BuildContext context, CharacterType characterType) {
    return {
      ListScreenPage.routeName: (context) => ListScreenPage(
            currentType: characterType,
          ),
    };
  }
}
