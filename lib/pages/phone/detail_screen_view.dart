import 'package:cached_network_image/cached_network_image.dart';
import 'package:character_viewer/models/character_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final CharacterDetail? details;
  const DetailScreen({super.key, this.details});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    BoxFit imageFit = orientation == Orientation.landscape
        ? BoxFit.fitHeight
        : BoxFit.fitHeight;

    return details == null
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator(color: Colors.black)))
        : Scaffold(
            appBar: AppBar(title: Text(details?.name ?? "Character")),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: details?.iconUrl != null
                        ? CachedNetworkImage(
                            imageUrl: details?.iconUrl ?? "",
                            placeholder: (context, url) =>
                                Image.asset('assets/imgs/placeholder.jpg'),
                            width: screenWidth - 40,
                            height: 200,
                            fit: imageFit,
                          )
                        : Image.asset(
                            'assets/imgs/placeholder.jpg',
                            width: screenWidth - 40,
                            height: 200,
                            fit: imageFit,
                          ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  ListTile(
                    title: Text(details?.detail ?? ""),
                  ),
                ],
              ),
            ),
          );
  }
}
