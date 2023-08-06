import 'package:character_viewer/pages/phone/list_screen/list_screen_model.dart';
import 'package:character_viewer/pages/phone/list_screen/list_screen_view.dart';
import 'package:character_viewer/services/character_request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreenPage extends StatelessWidget {
  final CharacterType currentType;
  const ListScreenPage({super.key, required this.currentType});
  static const routeName = '/list_screen';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListScreenModel>(
            create: (context) => ListScreenModel(context, currentType)),
      ],
      child: const ListScreenView(),
    );
  }
}
