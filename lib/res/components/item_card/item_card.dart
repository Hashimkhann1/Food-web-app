import 'package:food_web_animation/view.dart';


class ItemCard extends StatefulWidget {

  final String image;
  final String title;
  final String subtitle;
  final String description;
  final String price;
  final int index;

  const ItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.index
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
