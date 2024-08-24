import 'package:food_web_animation/models/footer_model/footer_model.dart';
import 'package:food_web_animation/view.dart';

class FooterLink extends StatelessWidget {
  final Footer footer;
  const FooterLink({super.key, required this.footer});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          footer.title,
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w700, fontSize: 20.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: footer.parameters
                .map(
                  (params) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      params,
                      style: GoogleFonts.quicksand(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                )
                .toList())
      ],
    );
  }
}
