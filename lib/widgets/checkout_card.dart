import 'package:flutter/material.dart';
import 'package:shamo/model/cart_model.dart';
import 'package:shamo/provider/cart_provider.dart';
import 'package:shamo/theme.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;
  const CheckoutCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: primaryTextColor,
              image: DecorationImage(
                  image: NetworkImage(cart.product!.galleries![0].url!),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product!.name!,
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Text(
                "\$${cart.product!.price}",
                style: priceTextStyle,
              ),
            ],
          ),
          const Spacer(),
          Text(
            "${cart.quantity.toString()} Item",
            style: subtitleTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
