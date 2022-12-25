import 'package:flutter/material.dart';
import 'package:shamo/model/product_model.dart';
import 'package:shamo/theme.dart';

class ChatBubble extends StatelessWidget {
  bool isSender = false;
  final ProductModel product;
  String text;

  ChatBubble({
    super.key,
    required this.isSender,
    required this.text,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        constraints: BoxConstraints(
          minHeight: 155,
          maxWidth: MediaQuery.of(context).size.width * 0.62,
        ),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: isSender == true ? chatBubbleColor : bgColor4,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender ? 12 : 0),
            topRight: Radius.circular(isSender ? 0 : 12),
            bottomLeft: const Radius.circular(12),
            bottomRight: const Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryTextColor,
                    image: const DecorationImage(
                        image: AssetImage('assets/image_shoes.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "COURT VISION 2.0 SHOES",
                        style: primaryTextStyle,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "\$57,15",
                        style: priceTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Add to Cart",
                    style: purpleTextStyle,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: primaryTextStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        product is UninitializedProductModel
            ? const SizedBox()
            : productPreview(),
        Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: isSender == true
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: isSender == true ? chatBubbleColor : bgColor4,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 12 : 0),
                      topRight: Radius.circular(isSender ? 0 : 12),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    text,
                    style: primaryTextStyle,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
