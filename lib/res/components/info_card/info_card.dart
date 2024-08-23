import 'package:food_web_animation/models/infos/infos.dart';
import 'package:food_web_animation/view.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatefulWidget {
  final Info info;
  const InfoCard({super.key, required this.info});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {

  bool isAnimate = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000) , () {
      setState(() {
        isAnimate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: isAnimate ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 575),
      reverseDuration: Duration(milliseconds: 375),
      alignment: Alignment.center,
      firstCurve: Curves.easeOut,
      secondCurve: Curves.easeOut,
      firstChild: Container(
        margin: EdgeInsets.symmetric(vertical: 25.0,horizontal: 5),
        height: 260.0,
        width: 220.0,
      ),
      secondChild: Container(
        margin: EdgeInsets.all(25.0),
        height: 260.0,
        width: 220.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    color: Color(0xFFBE133C),
                    borderRadius: BorderRadius.circular(100.0)),
                child: Icon(
                  widget.info.iconData,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                widget.info.title,
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                widget.info.description,
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Colors.black38,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
