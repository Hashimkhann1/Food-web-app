import 'package:food_web_animation/view.dart';
import 'package:food_web_animation/view/sections/second_section/second_section.dart';



class WholeView extends StatefulWidget {
  const WholeView({super.key});

  @override
  State<WholeView> createState() => _WholeViewState();
}

class _WholeViewState extends State<WholeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SecondSection(),
        
            SizedBox(height: 920,),
        
            FirstSection(),
        
        
          ],
        ),
      ),
    );
  }
}
