import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/model/product_model.dart';
import 'package:shamo/provider/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class WishlistCard extends StatefulWidget {
  final ProductModel product;
  const WishlistCard({super.key, required this.product});

  @override
  State<WishlistCard> createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      padding: const EdgeInsets.only(left: 12, top: 12, right: 20, bottom: 12),
      margin: const EdgeInsets.only(bottom: 20),
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
              color: primaryTextColor,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image:
                    NetworkImage(widget.product.galleries![0].url.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.name!,
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "\$${widget.product.price}",
                style: priceTextStyle,
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: secondaryColor,
            ),
            child: GestureDetector(
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      content: Center(
                        child: Text(
                          "Remove from your favorite?",
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                              ),
                              child: Text(
                                "Cancel",
                                style: primaryTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                wishlistProvider.setProduct(widget.product);
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 1),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(10)),
                                      ),
                                      content: Text(
                                        "Has been removed from the Whitelist",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      backgroundColor: alertColor,
                                    ),
                                  );
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: subtitleTextColor,
                              ),
                              child: Text(
                                "Remove",
                                style: primaryTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Image.asset(
                'assets/button_wishlist_blue.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
