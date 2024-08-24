import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_web_animation/models/items_model/items_model.dart';
import 'package:food_web_animation/res/components/item_card/item_card.dart';
import 'package:food_web_animation/res/components/scroll_offset/scroll_offset.dart';
import 'package:food_web_animation/res/components/text_reveal.dart';
import 'package:food_web_animation/view.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({super.key});

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: (Duration(milliseconds: 1000)),
        reverseDuration: Duration(milliseconds: 375));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DisplayOffset, ScrollOffset>(

          buildWhen: (previous, current) {
            if ((current.scrollOffsetValue >= 900 &&
                current.scrollOffsetValue <= 1300) ||
                controller.isAnimating) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if(state.scrollOffsetValue > 1100){
              controller.forward();
            }else{
              controller.reverse();
            }

            return TextReveal(
                child: Text(
                  "Dish of the Day",
                  style: GoogleFonts.quicksand(
                      fontSize: 55.0, fontWeight: FontWeight.w700),
                ),
                maxHeight: 70,
                controller: controller);
          },
        ),
        SizedBox(
          height: 100,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
          child: Center(
            child: Wrap(
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 70.0,
              spacing: 100.0,
              children: items.map<Widget>((item) {
                return ItemCard(
                    image: item.image,
                    title: item.title,
                    subtitle: item.subtitle,
                    description: item.description,
                    price: item.price,
                    index: items.indexOf(item));
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
