import 'package:cuoiki/components/mybutton.dart';
import 'package:cuoiki/models/shop.dart';
import 'package:cuoiki/page/cart_page.dart';
import 'package:cuoiki/page/loginpage.dart';
import 'package:cuoiki/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:cuoiki/components/food_tile.dart';
import 'package:cuoiki/page/food_details_page.dart';
import 'package:provider/provider.dart';
import 'package:cuoiki/components/drawer.dart';

class MenuPage extends StatefulWidget {
  const MenuPage(someData, {super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigate to food item details page
  void navigateToFoodDetails(int index) {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.grey[800],
            elevation: 0,
            // leading: Builder(
            //   builder: (context) => IconButton(
            //     icon: const Icon(Icons.menu),
            //     onPressed: () {
            //       Scaffold.of(context).openDrawer();
            //     },
            //   ),
            // ),
            title: const Text('Đà Nẵng'),
            actions: [
              // cart button
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                icon: const Icon(Icons.shopping_cart),
              ),

              const SizedBox(width: 5),

              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                icon: const Icon(Icons.login),
              ),
            ],
          ),

          const SizedBox(height: 20),
          //banner
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // message
                    Text(
                      "Nhận khuyến mãi 30%",
                      style: GoogleFonts.dmSerifDisplay(
                        FontSize: 20,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // button
                    MyButton(
                      text: "Redeem",
                      onTap: () {},
                    ),
                  ],
                ),

                // img
                Image.asset(
                  'assets/image/fish.png',
                  height: 100,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here..",
              ),
            ),
          ),

          const SizedBox(height: 25),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),

          const SizedBox(height: 10),

          //popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/image/eggs.png',
                      height: 60,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trứng",
                          style: GoogleFonts.dmSerifDisplay(
                            FontSize: 18,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '10.000vnđ',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomDirector(),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    title: Text("H O M E"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    title: Text("P R O F I L E"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.food_bank,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    title: Text("M E N U F O O D"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("L O G O U T"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomDirector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomDirectorState();
  }
}

class _BottomDirectorState extends State<BottomDirector> {
  int _selected = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      clipper: CustomClipath(),
      elevation: 10.0,
      color: Colors.white,
      shadowColor: Colors.black,
      child: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              label: 'explore',
              icon: ImageIcon(
                NetworkImage(
                    'https://res.cloudinary.com/dwu92ycra/image/upload/v1696839304/user_lu1npf.png'),
                color: Color.fromARGB(255, 166, 136, 158),
              ),
            ),
            BottomNavigationBarItem(
              label: 'location',
              icon: ImageIcon(
                NetworkImage(
                    'https://res.cloudinary.com/dwu92ycra/image/upload/v1696839753/Group_issl7l.png'),
                color: Color.fromARGB(255, 166, 136, 158),
              ),
            ),
            BottomNavigationBarItem(
              label: 'message',
              icon: ImageIcon(
                NetworkImage(
                    'https://res.cloudinary.com/dwu92ycra/image/upload/v1696839753/Glyph_hroxs0.png'),
                color: Color.fromARGB(255, 166, 136, 158),
              ),
            ),
            BottomNavigationBarItem(
              label: 'notification',
              icon: ImageIcon(
                NetworkImage(
                    'https://res.cloudinary.com/dwu92ycra/image/upload/v1696839304/Page_1_jercpg.png'),
                color: Color.fromARGB(255, 166, 136, 158),
              ),
            ),
            BottomNavigationBarItem(
              label: 'user',
              icon: ImageIcon(
                NetworkImage(
                    'https://res.cloudinary.com/dwu92ycra/image/upload/v1696839305/Group_er6rds.png'),
                color: Color.fromARGB(255, 166, 136, 158),
              ),
            ),
          ],
          selectedItemColor: Color.fromARGB(255, 166, 136, 158),
          currentIndex: _selected,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class CustomClipath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0); // Di chuyển đến góc trên cùng bên trái
    path.lineTo(0, size.height); // Line đến góc dưới cùng bên trái
    path.lineTo(size.width, size.height); // Line đến góc dưới cùng bên phải
    path.lineTo(size.width, 0); // Line đến góc trên cùng bên phải
    path.quadraticBezierTo(
        size.width / 2, -20, 0, 0); // Tạo đường cong ở phần trên cùng
    path.close(); // Đóng đường path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
