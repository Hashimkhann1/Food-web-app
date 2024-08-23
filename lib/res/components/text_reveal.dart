

import 'package:flutter/cupertino.dart';

class TextReveal extends StatefulWidget {
  final Widget? child;
  final double maxHeight;
  final AnimationController controller;
  final Animation<double>? textRevelAnimation;
  final Animation<double>? textOpacityAnimation;
  const TextReveal({super.key,required this.child,required this.maxHeight,required this.controller,this.textOpacityAnimation,this.textRevelAnimation});


  @override
  State<TextReveal> createState() => _TextRevealState();
}

class _TextRevealState extends State<TextReveal> with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> textRevelAnimation;
  late Animation<double> textOpacityAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = widget.controller;

    textRevelAnimation = widget.textRevelAnimation ?? Tween<double>(begin: 100.0,end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.3,curve: Curves.easeOut))
    );

    textOpacityAnimation = widget.textOpacityAnimation ?? Tween<double>(begin: 0.0,end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.3,curve: Curves.easeOut))
    );


  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context , child) {
        return LimitedBox(
          maxHeight: widget.maxHeight,
          child: Container(
            padding: EdgeInsets.only(top: textRevelAnimation.value),
            child: FadeTransition(
              opacity: textOpacityAnimation,
                child: widget.child
            ),
          ),
        );
      }
    );
  }
}
