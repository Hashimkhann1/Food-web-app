import 'package:food_web_animation/res/components/text_reveal.dart';
import 'package:food_web_animation/view.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> textRevelAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;
  late Animation<double> smallImageRevealAnimation;
  late Animation<double> smallImageOpacityAnimation;
  late Animation<double> naveBarOpiactyAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 1700),
      reverseDuration: Duration(milliseconds: 375)
    );

    textRevelAnimation = Tween<double>(begin: 100.0,end: 0.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.3,curve: Curves.easeOut))
    );

    textOpacityAnimation = Tween<double>(begin: 0.0,end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.3,curve: Curves.easeOut))
    );

    descriptionAnimation = Tween<double>(begin: 0.0,end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.3, 0.5,curve: Curves.easeOut))
    );

    smallImageRevealAnimation = Tween<double>(begin: 180.0,end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.5, 0.7,curve: Curves.easeOut))
    );

    smallImageOpacityAnimation = Tween<double>(begin: 0.0,end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.6, 0.8,curve: Curves.easeOut))
    );

    naveBarOpiactyAnimation = Tween<double>(begin: 0.0,end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.8, 1.0,curve: Curves.easeOut))
    );
    
    Future.delayed(Duration(milliseconds: 1000),() {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(left: 100),
      height: 920.0,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context , child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeTransition(
                    opacity: textOpacityAnimation,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Logo",
                          style: GoogleFonts.montserrat(),
                        )),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextReveal(
                          maxHeight: 90.0,
                          textOpacityAnimation: textOpacityAnimation,
                          textRevelAnimation: textRevelAnimation,
                          controller: controller,
                          child: Text(
                            "Healthy & Tasty",
                            style: GoogleFonts.quicksand(
                                fontSize: 65.0, fontWeight: FontWeight.w700),
                          ),
                        ),
                        TextReveal(
                          maxHeight: 90.0,
                          textOpacityAnimation: textOpacityAnimation,
                          textRevelAnimation: textRevelAnimation,
                          controller: controller,
                          child: Text(
                            "Food",
                            style: GoogleFonts.quicksand(
                                fontSize: 65.0, fontWeight: FontWeight.w700),
                          ),
                        ),

                        const SizedBox(height: 30,),

                        FadeTransition(
                          opacity: descriptionAnimation,
                          child: Text(
                            "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content document or a typeface without relying on meaningful content",
                            style: GoogleFonts.quicksand(
                                fontSize: 22.0, fontWeight: FontWeight.w500),
                          ),
                        ),

                        const SizedBox(height: 50,),

                        FadeTransition(
                          opacity: descriptionAnimation,
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15.0,
                                  color: Colors.black12
                                )
                              ]
                            ),

                            child: SizeTransition(
                              sizeFactor: descriptionAnimation,
                              axis: Axis.horizontal,
                              axisAlignment: -1.0,
                              child: Row(
                                children: [
                                  const Flexible(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.all(12),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.zero,
                                            borderSide: BorderSide.none
                                          )
                                        ),
                                      )
                                  ),

                                  Container(
                                    width: 49,
                                    height: 49,
                                    color: Colors.red,
                                    child: const Icon(Icons.search),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 50.0,
                        ),

                        Flexible(child: Row(
                          children: [
                            SizedBox(
                              height: 120.0,
                              width: 180,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding:  const EdgeInsets.all(1.0),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1609618298169-425a11118f24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
                                      fit: BoxFit.cover,
                                      width: 180.0,
                                    ),
                                  ),

                                  Container(
                                    height: 120,
                                    width: smallImageRevealAnimation.value,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),

                            const SizedBox(width: 20.0,),

                            Flexible(child: FadeTransition(opacity: smallImageOpacityAnimation, child: Text('Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful document or a typeface',style: GoogleFonts.quicksand(fontSize: 16.0,height: 1.5,fontWeight: FontWeight.w500),)))
                          ],
                        )),
                      ],
                    ),
                  ))
                ],
              )),

              const SizedBox(width: 150.0,),
              const Expanded(child: FirstPageImage()),


              SizedBox(
                width: 100.0,
                height: 500.0,
                child: FadeTransition(
                  opacity: naveBarOpiactyAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 80.0,
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: Colors.black,)),
                      ),

                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: ['Home' , 'About' , 'Offers' , 'Account'].map<Widget>((title) {
                          return RotatedBox(quarterTurns: 1, child: Text(title,style: GoogleFonts.quicksand(fontSize: 14.0,),));
                        }).toList(),
                      ))
                    ],
                  ),
                ),
              ),

            ],
          );
        }
      ),
    );
  }
}


class FirstPageImage extends StatefulWidget {
  const FirstPageImage({super.key});

  @override
  State<FirstPageImage> createState() => _FirstPageImageState();
}

class _FirstPageImageState extends State<FirstPageImage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        vsync: this,
      duration: const Duration(
        milliseconds: 775
      )
    );

    _animation = Tween<double>(begin: 920.0,end: 0.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Image.network('https://images.unsplash.com/photo-1551879400-111a9087cd86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
      fit: BoxFit.cover,
      loadingBuilder: (context , child , loadinProgress) {
      if(loadinProgress == null) {
        Future.delayed(const Duration(milliseconds: 375) , () {
          if(_controller.isDismissed){
            _controller.forward();
          }
        });
        
        return AnimatedBuilder(
          animation: _animation,
          builder: (context , child) {
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  height: 920,
                  width: double.infinity,
                  child: child,
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: _animation.value,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                )
              ],
            );
          },
          child: child,
        );
      }

      return const SizedBox();
      },
    );
  }
}
