import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_web_animation/models/chefs_model/chefs_model.dart';
import 'package:food_web_animation/res/components/chef_card/chef_card.dart';
import 'package:food_web_animation/res/components/scroll_offset/scroll_offset.dart';
import 'package:food_web_animation/res/components/text_reveal.dart';
import 'package:food_web_animation/view.dart';
import 'package:google_fonts/google_fonts.dart';

class FifthSection extends StatefulWidget {
  const FifthSection({super.key});

  @override
  State<FifthSection> createState() => _FifthSectionState();
}

class _FifthSectionState extends State<FifthSection>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      reverseDuration: Duration(milliseconds: 375),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DisplayOffset, ScrollOffset>(
          buildWhen: (previous, current) {
            if (current.scrollOffsetValue >= 3000) {
              return true;
            } else {
              return false;
            }
          },

          builder: (context, state) {

            if(state.scrollOffsetValue > 3100) {
              controller.forward();
            }else{
              controller.reverse();
            }

            return TextReveal(
              maxHeight: 55.0,
              controller: controller,
              child: Text(
                'Most Expert Chefs',
                style: GoogleFonts.quicksand(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),

        const SizedBox(
          height: 50.0,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: chefs.map((chef) => ChefCard(chef: chef,)).toList(),
        )

      ],
    );
  }
}
