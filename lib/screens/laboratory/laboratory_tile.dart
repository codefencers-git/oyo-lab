import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:oyo_labs/themedata.dart';
import '../../widgets/buttons/round_book_slot.dart';
import 'laboratory_detail.dart';

class LaboratoryTile extends StatelessWidget {
  const LaboratoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: ThemeClass.orangeLightColor,
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              spreadRadius: 0.0,
              offset: Offset(5, 3),
              color: Colors.grey.withOpacity(0.5),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/laboratory_image.png",
            width: width / 2.1,
            // height: height / 3,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              top: 10,
            ),
            child: Text(
              "Green Cross Laboratory",
              style: TextStyle(fontSize: 10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              top: 5,
            ),
            child: Text(
              "1 Km Away",
              style: TextStyle(fontSize: 8),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 5.0,
              top: 0.2,
            ),
            child: Row(
              children: [
                RatingBar(
                  initialRating: 3,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 16,
                  itemCount: 5,
                  ignoreGestures: true,
                  ratingWidget: RatingWidget(
                    full: _image('assets/images/full_star.png'),
                    half: _image('assets/images/half_star.png'),
                    empty: _image('assets/images/blank_star.png'),
                  ),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.7),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    '4.0',
                    style: TextStyle(
                        fontSize: 8,
                        color: ThemeClass.redColor,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    '(120)',
                    style: TextStyle(
                        fontSize: 8,
                        color: ThemeClass.blackColor,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: RoundButtonBookSlot(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LaboratoryDetail()),
                );
                print("object");
              },
              label: 'Book a Slot',
            ),
          ),
          // comment
        ],
      ),
    );
  }

  _image(String s) {
    return Image.asset(
      s,
      height: 20,
    );
  }
}
