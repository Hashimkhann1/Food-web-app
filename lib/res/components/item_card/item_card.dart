import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_web_animation/res/components/scroll_offset/scroll_offset.dart';
import 'package:food_web_animation/view.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final String price;
  final int index;

  const ItemCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.price,
      required this.index});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageReveal;
  late Animation<double> imageOpacity;
  late Animation<double> headingTextOpacity;
  late Animation<double> subTextOpacity;
  late Animation<double> descriptionOpacity;
  late Animation<double> priceOpacity;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
        reverseDuration: const Duration(milliseconds: 500));

    imageReveal = Tween<double>(begin: 0.0, end: 170.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.5, curve: Curves.easeOut)));

    imageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.5, curve: Curves.easeOut)));

    headingTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.3, 0.5, curve: Curves.easeOut)));

    subTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.4, 0.6, curve: Curves.easeOut)));

    descriptionOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.6, 0.8, curve: Curves.easeOut)));

    priceOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.8, 1.0, curve: Curves.easeOut)));

    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
      buildWhen: (previous, current) {
        if ((current.scrollOffsetValue >= 1000 &&
            current.scrollOffsetValue <= 1950) ||
            controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },

  builder: (context, state) {

    if(state.scrollOffsetValue >= (1100 + widget.index * 100)){
      controller.forward();
    }else{
      controller.reverse();
    }

    return Container(
      height: 180.0,
      width: 580.0,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context , child) {
          return Row(
            children: [
              SizedBox(
                height: 180.0,
                width: 180.0,
                child: Center(
                  child: FadeTransition(
                    opacity: imageOpacity,
                    child: SizedBox(
                      width: imageReveal.value,
                      height: imageReveal.value,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.medium,
                          scale: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    opacity: headingTextOpacity,
                    child: Text(
                      widget.title,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                  ),
                  FadeTransition(
                    opacity: subTextOpacity,
                    child: Text(
                      widget.subtitle,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Colors.black38),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FadeTransition(
                    opacity: descriptionOpacity,
                    child: Text(
                      widget.description,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          color: Colors.black54),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  FadeTransition(
                    opacity: priceOpacity,
                    child: Text(
                      widget.price,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                          color: Color(0xFFBE133C)),
                    ),
                  ),
                ],
              ))
            ],
          );
        }
      ),
    );
  },
);
  }
}
