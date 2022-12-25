import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/cart_provider.dart';
import 'package:shamo/theme.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(top: defaultMargin),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Summary",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product Quantity",
                style: subtitleTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                "${cartProvider.totalItems().toString()} Item",
                style: primaryTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product Price",
                style: subtitleTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                "\$${cartProvider.totalPrice().toString()}",
                style: primaryTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping",
                style: subtitleTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                "Free",
                style: primaryTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product Price",
                style: subtitleTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                "\$575.96",
                style: primaryTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: bgColor5,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: priceTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Text(
                "\$575.92",
                style: priceTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
