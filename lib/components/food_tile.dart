import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image
            Image.asset(
              food.imagePath,
              height: 140,
            ),

            //text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                  FontSize: 20, color: Colors.white, fontSize: 0),
            ),

            // price + rating
            SizedBox(
              width: 100,
              child: Row(
                children: [
                  //price
                  Text(food.price + '\vnđ'),

                  //rating
                  Icon(Icons.star),
                  Text(food.rating),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GoogleFonts {
  static dmSerifDisplay(
      {required int FontSize, required Color color, required int fontSize}) {}
}
