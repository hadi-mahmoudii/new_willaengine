import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constant/color.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatefulWidget {
  final int starCount;
  final double? starSize;
  double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({this.starCount = 5, this.rating = .0, required this.onRatingChanged, this.color = AppColors.lightBlue, this.starSize});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double rating = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        rating = widget.rating;
        print(rating);
      });
    });
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        size: widget.starSize ?? 13,
        Icons.star_border,
        color: AppColors.greenTitle,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: widget.color ?? Theme.of(context).primaryColor,
        size: widget.starSize ?? 13,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: widget.color ?? Theme.of(context).primaryColor,
        size: widget.starSize ?? 13,
      );
    }
    return InkResponse(
      onTap: () {
        widget.onRatingChanged(index + 1.0);
        setState(() {
          rating = index + 1;
        });
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
      for (var i = 0; i < widget.starCount; i++) buildStar(context, i),
      Text(
        rating.toString(),
        style: TextStyle(
          fontSize: 8.sp,
          fontFamily: "montserrat",
        ),
      )
    ]
        // List.generate(widget.starCount, (index) => buildStar(context, index))
        );
  }
}
