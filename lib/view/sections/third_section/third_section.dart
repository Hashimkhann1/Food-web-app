import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_web_animation/models/infos/infos.dart';
import 'package:food_web_animation/res/components/info_card/info_card.dart';
import 'package:food_web_animation/res/components/scroll_offset/scroll_offset.dart';
import 'package:food_web_animation/res/components/text_reveal.dart';
import 'package:food_web_animation/view.dart';
import 'package:google_fonts/google_fonts.dart';


class ThirdSection extends StatefulWidget {
  const ThirdSection({super.key});

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000),
        reverseDuration: Duration(milliseconds: 375)
    );


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510,
      color: const Color(0xFFBE133C).withOpacity(0.1),
      child: Column(
        children: [
          SizedBox(height: 50.0,),

          BlocBuilder<DisplayOffset, ScrollOffset>(
            buildWhen: (previous, current) {
              if ((current.scrollOffsetValue >= 1900 &&
                  current.scrollOffsetValue <= 2300) ||
                  controller.isAnimating) {
                return true;
              } else {
                return false;
              }
            },

            builder: (context, state) {

              if(state.scrollOffsetValue >= 2100){
                controller.forward();
              }else{
                controller.reverse();
              }

              return TextReveal(maxHeight: 55.0,
                  controller: controller,
                  child: Text("How It Works", style: GoogleFonts.quicksand(
                      fontSize: 45.0, fontWeight: FontWeight.w700),));
            },
          ),

          const SizedBox(height: 40.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: infos.map((info) => InfoCard(info: info,)).toList(),
          ),

          const SizedBox(height: 50.0,),


        ],
      ),
    );
  }
}
