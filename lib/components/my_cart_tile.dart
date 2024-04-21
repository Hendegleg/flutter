import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_quantity_selector.dart';
import 'package:flutter_application_1/models/cart_item.dart';
import 'package:flutter_application_1/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({Key? key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.food.name),
                      Text(
                        (cartItem.food.price * cartItem.quantity)
                                .toStringAsFixed(2) +
                            ' dt', // Mettre à jour le prix en fonction de la quantité
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onDecrement: () {
                          restaurant.removeFromCart(cartItem);
                        },
                        onIncrement: () {
                          restaurant.addToCart(
                              cartItem.food, cartItem.selectedAddons);
                        },
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                            label: Row(
                              children: [
                                Text(addon.name),
                                Text(' (${addon.price} dt)'),
                              ],
                            ),
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            onSelected: (value) {},
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            labelStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 12,
                            )),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
