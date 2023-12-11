import "package:flutter/material.dart";
import 'package:gallery_api/photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<dynamic> photos = [];

  @override
  void initState() {
    super.initState();
    getPhotos();
  }

  getPhotos() async {
    var url =
        Uri.parse("https://jsonplaceholder.typicode.com/photos/?_limit=20");
    var response = await http.get(url);

    // print(response.body);
    setState(() {
      photos = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: photos.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoPage(
                    number: photos[index]["id"],
                    photoUrl: photos[index]["url"],
                    title: photos[index]["title"],
                  ),
                ),
              );
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(photos[index]["thumbnailUrl"]),
                ),
              ),
              // child: Text('${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
