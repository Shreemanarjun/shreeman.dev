import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide Component;

/// A helper component to render a star rating.
class StarRating extends StatelessComponent {
  const StarRating({required this.rating});

  final double rating;

  @override
  Component build(BuildContext context) {
    if (rating <= 0) {
      return text(''); // Render nothing if rating is 0 or less
    }

    final stars = <Component>[];
    final fullStars = rating.floor();
    final hasHalfStar = (rating - fullStars) >= 0.5;
    final starColor = Color('#ffc107'); // amber-500
    final emptyStarColor = Color('#e5e7eb'); // gray-200

    for (var i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(
          Star(
            height: 16.px,
            width: 16.px,
            styles: Styles(color: starColor, raw: {'fill': starColor.value}),
          ),
        );
      } else if (i == fullStars && hasHalfStar) {
        stars.add(
          StarHalf(
            height: 16.px,
            width: 16.px,
            styles: Styles(color: starColor, raw: {'fill': starColor.value}),
          ),
        );
      } else {
        stars.add(
          Star(
            height: 16.px,
            width: 16.px,
            styles: Styles(color: emptyStarColor, raw: {'fill': emptyStarColor.value}),
          ),
        );
      }
    }

    return div(
      classes: "flex items-center gap-1.5",
      [
        ...stars,
        span(classes: "ml-1 text-xs", [text('($rating)')]),
      ],
    );
  }
}
