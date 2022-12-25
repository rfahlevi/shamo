import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/model/cart_model.dart';
import 'package:shamo/model/product_model.dart';
import 'package:shamo/provider/cart_provider.dart';
import 'package:shamo/theme.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  const CartCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      constraints: const BoxConstraints(
        maxHeight: 116,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  cartProvider.removeCart(cart.id!);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_rounded,
                      color: alertColor,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Remove",
                      style: alertTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Text(
                cart.product!.name!,
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Text(
                "\$${cart.product!.price!}",
                style: priceTextStyle,
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  cartProvider.addQuantity(cart.id!);
                },
                child: Image.asset(
                  'assets/button_add.png',
                  width: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                cart.quantity.toString(),
                style: primaryTextStyle,
              ),
              const SizedBox(
                height: 2,
              ),
              GestureDetector(
                onTap: () {
                  cartProvider.reduceQuantity(cart.id!);
                },
                child: Image.asset(
                  'assets/button_min.png',
                  width: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
