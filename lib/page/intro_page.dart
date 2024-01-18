import 'package:cuoiki/components/mybutton.dart';
import 'package:cuoiki/page/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/th.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(height: 20),

            // Padding(
            //   padding: const EdgeInsets.all(30.0),
            //   child: Image.asset('assets/image/logo.png'),
            // ),
            // const SizedBox(height: 10),
            Image(
              image: AssetImage('assets/image/diet.png'),
              width: 100,
              height: 100,
            ),

            const SizedBox(height: 25),

            Center(
              child: Text(
                "GOOD FOOD RESTAURANT",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),

            const SizedBox(height: 10),

            MyButton(
              text: "Get Start",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuPage(
                        [],
                      ),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
