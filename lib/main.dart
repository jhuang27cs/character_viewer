import 'package:character_viewer/pages/phone/list_screen/list_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'injectable_init.dart';
import 'pages/tablet/home_page_view.dart';
import 'provider/device_router_provider.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                    DeviceRouterProvider().getRouter(context);
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
                ListScreenPage.routeName: (context) => const ListScreenPage(),
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
