import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});
  void openLocationSearchBox(BuildContext context) {
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Votre localisation"),
        content:  TextField(
          controller: textController,
          decoration: InputDecoration(hintText: "Saisir votre adresse.."),
        ),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          MaterialButton(
            onPressed: () {
              String newAddress = textController.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Livrer maintenant",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
