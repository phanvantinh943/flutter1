import 'package:flutter/material.dart';
import 'package:cuoiki/theme/lightmode.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // backgroundColor: Theme.of(context).colorScheme.background,
        // child: Column(
        //   children: [
        //     DrawerHeader(
        //       child: Icon(
        //         Icons.favorite,
        //         color: Theme.of(context).colorScheme.inversePrimary,
        //       ),
        //     ),
        //     const SizedBox(height: 25),
        //     Padding(
        //       padding: const EdgeInsets.only(left: 25.0),
        //       child: ListTile(
        //         leading: Icon(
        //           Icons.home,
        //           color: Theme.of(context).colorScheme.inversePrimary,
        //         ),
        //         title: Text("H O M E"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(left: 25.0),
        //       child: ListTile(
        //         leading: Icon(
        //           Icons.person,
        //           color: Theme.of(context).colorScheme.inversePrimary,
        //         ),
        //         title: Text("P R O F I L E"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(left: 25.0),
        //       child: ListTile(
        //         leading: Icon(
        //           Icons.group,
        //           color: Theme.of(context).colorScheme.inversePrimary,
        //         ),
        //         title: Text("U S E R"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(left: 25.0),
        //       child: ListTile(
        //         leading: Icon(
        //           Icons.food_bank,
        //           color: Theme.of(context).colorScheme.inversePrimary,
        //         ),
        //         title: Text("M E N U F O O D"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(left: 25.0),
        //       child: ListTile(
        //         leading: Icon(
        //           Icons.home,
        //           color: Theme.of(context).colorScheme.inversePrimary,
        //         ),
        //         title: Text("L O G O U T"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
