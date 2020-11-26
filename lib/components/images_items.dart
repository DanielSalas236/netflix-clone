import 'package:flutter/material.dart';

class ImagesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network("https://www.arthipo.com/image/cache/catalog/poster/movie/1-758/pfilm204-movie-film-poster-transformers-dark-of-the-moon_3acd9e3c-1000x1000.jpg",
        width: 100.0,
        fit: BoxFit.cover,
        ),
        SizedBox(width: 10.0,)
      ],
    );
  }
}