import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  final int number;
  final String photoUrl;
  final String title;

  const PhotoPage(
      {super.key,
      required this.number,
      required this.photoUrl,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("$number"),
          // backgroundColor: Colors.grey,
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Photo $number",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 50,
          ),
          Image(
            image: NetworkImage(photoUrl),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Title:",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
