import 'package:character_viewer/pages/phone/list_screen/list_screen_model.dart';
import 'package:character_viewer/pages/phone/list_screen/list_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreenPage extends StatelessWidget {
  const ListScreenPage({super.key});
  static const routeName = '/list_screen';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListScreenModel>(
            create: (context) => ListScreenModel(context)),
      ],
      child: const ListScreenView(),
    );
  }
}
