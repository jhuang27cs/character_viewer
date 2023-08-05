import 'package:character_viewer/models/character_model.dart';
import 'package:character_viewer/pages/phone/detail_screen_view.dart';
import 'package:character_viewer/pages/phone/list_screen/list_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreenView extends StatefulWidget {
  const ListScreenView({super.key});

  @override
  State<ListScreenView> createState() => _ListScreenViewState();
}

class _ListScreenViewState extends State<ListScreenView> {
  // List of all items
  late final List<CharacterDetail> _allItems;
  late List<CharacterDetail> _searchedItems;
  late Future<List<CharacterDetail>> future;

  @override
  void initState() {
    super.initState();
    // Load list of all items
    ListScreenModel mdl = context.read<ListScreenModel>();
    future = mdl.getCharacterLists().then((value) {
      _allItems = value;
      _searchedItems = _allItems;
      return value;
    });
  }

  void _search(String term) {
    // Filter list based on search term
    setState(() {
      _searchedItems = _allItems
          .where((item) =>
              item.text?.toLowerCase().contains(term.toLowerCase()) ?? false)
          .toList();
    });
  }

  Widget getListContent() {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: ListView.builder(
                itemCount: _searchedItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(_searchedItems[index].name ?? ""),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<Widget>(
                              builder: (BuildContext context) =>
                                  DetailScreen(details: _searchedItems[index])),
                        );
                      });
                },
              ),
            );
          }
          return Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Names'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(hintText: 'Search'),
              onChanged: (text) {
                _search(text);
              },
            ),
          ),
          getListContent()
        ],
      ),
    );
  }
}
