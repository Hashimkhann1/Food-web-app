import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_web_animation/res/components/scroll_offset/scroll_offset.dart';
import 'package:food_web_animation/view.dart';
import 'package:food_web_animation/view/sections/fifth_section/fifth_section.dart';
import 'package:food_web_animation/view/sections/fourth_section/fourth_section.dart';
import 'package:food_web_animation/view/sections/second_section/second_section.dart';
import 'package:food_web_animation/view/sections/sixth_section/sixth_section.dart';

import 'sections/third_section/third_section.dart';



class WholeView extends StatefulWidget {
  const WholeView({super.key});

  @override
  State<WholeView> createState() => _WholeViewState();
}

class _WholeViewState extends State<WholeView> {

  late ScrollController scrollController;

  @override
  void initState() {

    scrollController = ScrollController();

    super.initState();

    scrollController.addListener(() {
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery.of(context).size.height + scrollController.position.pixels).toInt()
      );
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: const Column(
          children: [

            FirstSection(),

            SizedBox(height: 100,),

            SecondSection(),

            SizedBox(height: 100,),

            ThirdSection(),

            SizedBox(height: 100,),

            FourthSection(),

            SizedBox(height: 100,),

            FifthSection(),

            SizedBox(height: 100,),

            SixthSection(),
          ],
        ),
      ),
    );
  }
}
