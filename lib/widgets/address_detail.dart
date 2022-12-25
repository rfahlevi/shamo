import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class AddressDetail extends StatelessWidget {
  const AddressDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address Details",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icon_store_location.png',
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/icon_line.png',
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/icon_your_address.png',
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Text(
                    "Store Location",
                    style: subtitleTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
                  ),
                  Text(
                    "Adidas Core",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Your Address",
                    style: subtitleTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
                  ),
                  Text(
                    "Marsemoon",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
