import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingRowWidget extends StatefulWidget {
  const RatingRowWidget({super.key});

  @override
  _RatingRowWidgetState createState() => _RatingRowWidgetState();
}

class _RatingRowWidgetState extends State<RatingRowWidget> {
  double _rating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: _rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          updateOnDrag: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, index) {
            return Icon(
              index <= _rating - 1
                  ? Icons.star
                  : (index < _rating ? Icons.star_half : Icons.star_border),
              color: Colors.amber,
            );
          },
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
            print(rating);
          },
          // Enhancements
          itemSize: 30,
          unratedColor: Colors.grey[400],
          glow: false,
          ignoreGestures: false,
          tapOnlyMode: true,
        ),
        const SizedBox(height: 10),
        // Feedback Text
        Text(
          'Your Rating: $_rating',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
