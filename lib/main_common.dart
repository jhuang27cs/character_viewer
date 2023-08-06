import 'package:character_viewer/injectable_init.dart';
import 'package:character_viewer/pages/phone/list_screen/list_screen_page.dart';
import 'package:character_viewer/pages/tablet/home_page_view.dart';
import 'package:character_viewer/provider/device_router_provider.dart';
import 'package:character_viewer/services/character_request.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void mainCommon(CharacterType curType) {
  configureDependencies();
  runApp(CommonApp(
    type: curType,
  ));
}

class CommonApp extends StatefulWidget {
  final CharacterType type;
  const CommonApp({super.key, required this.type});

  @override
  State<CommonApp> createState() => _CommonAppState();
}

class _CommonAppState extends State<CommonApp> {
  // This widget is the root of your application.
  final Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Use mobile layout with separate list and detail screens
          return MaterialApp(
              onGenerateRoute: (settings) {
                late Map<String, Widget Function(BuildContext)>
                    deviceSpecificRoutes;
                logger.d('trying to route to ${settings.name}');
                if (settings.name == '/') return null;
                deviceSpecificRoutes =
                    DeviceRouterProvider().getRouter(context, widget.type);
                if (!deviceSpecificRoutes.keys
                    .toList()
                    .contains(settings.name)) {
                  logger.d('deviceRoutes doesn\'t contains the given key');
                  logger.d(
                      'available routes: ${deviceSpecificRoutes.keys.toList()}, aim route: ${settings.name}');
                  return null;
                }
                return MaterialPageRoute(
                    settings: settings,
                    builder: deviceSpecificRoutes[settings.name!]!);
              },
              initialRoute: ListScreenPage.routeName,
              routes: {
                ListScreenPage.routeName: (context) => ListScreenPage(
                      currentType: widget.type,
                    ),
              });
        } else {
          // Use tablet layout with list and detail on same screen
          return const MaterialApp(
            home: HomePage(),
          );
        }
      },
    );
  }
}
