import 'package:food_web_animation/models/footer_model/footer_model.dart';
import 'package:food_web_animation/res/components/footer_link/footer_link.dart';
import 'package:food_web_animation/view.dart';

class SixthSection extends StatefulWidget {
  const SixthSection({super.key});

  @override
  State<SixthSection> createState() => _SixthSectionState();
}

class _SixthSectionState extends State<SixthSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Color(0xFFBE133C).withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: footer.map((footerData) => FooterLink(footer: footerData,)).toList(),
          )),

          Container(
            margin: EdgeInsets.only(left: 50.0,right: 80.0),
            width: 250.0,
            height: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Subscribe Now',
                  style: GoogleFonts.quicksand(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(
                  height: 15.0,
                ),

                TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.person_outline_rounded,
                      color: Colors.black,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    hintText: 'Your Email',
                    hintStyle: GoogleFonts.quicksand(
                      color: Colors.black45,
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black26,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black26,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),

            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 50.0,
              width: 250.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFBE133C),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Subscribe Now',
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),)

              ],
            ),
          )
        ],
      ),
    );
  }
}
