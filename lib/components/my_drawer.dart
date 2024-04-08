import 'package:flutter/material.dart';
import 'my_drawer_tile.dart';


class MyDrawer extends StatelessWidget {
  
  const MyDrawer({super.key});

  @override
    Widget build(BuildContext context) {
        return Drawer(
            backgroundColor: Theme.of(context).colorScheme.background,
            child: Column(
                children: [
                    Padding(
                        padding: const EdgeInsets.only(top:100.0),
                        child: Icon(
                            Icons.lock_open_rounded,
                            size: 80, color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                    ),

                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Divider(
                        color: Theme.of(context).colorScheme.secondary,
                        ),
                    ),

                    MyDrawerTile(text: "A C C U E I L", icon: Icons.home, onTap: () {},),
                    MyDrawerTile(text: "P A R A M E T R E S", icon: Icons.settings, onTap: () {},),

                    const Spacer(), 

                    MyDrawerTile(text: "D E C O N N E X I O N ", icon: Icons.logout, onTap: () {},),

                    const SizedBox(height: 25),



                    
                ],
            ),
        );
    }
}