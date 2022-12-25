import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/image_shop_logo.png',
              width: 54,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shoe Store",
                    style: primaryTextStyle.copyWith(fontSize: 15),
                  ),
                  Text(
                    "Good night, This item is on warehouse when",
                    style: subtitleTextStyle.copyWith(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Text(
              "Now",
              style: subtitleTextStyle,
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Divider(
          thickness: 1,
          color: bgColor2,
        ),
      ],
    );
  }
}
