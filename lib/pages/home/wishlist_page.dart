import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/page_provider.dart';
import 'package:shamo/provider/wishlist_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    PageProvider pageProvider = Provider.of<PageProvider>(context);

    PreferredSize appBar() {
      return PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            title: Text(
              "Favorite Shoes",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            centerTitle: true,
            backgroundColor: bgColor1,
            elevation: 0,
          ));
    }

    Widget emptyState() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_love.png',
              width: 72,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              " You don't have dream shoes?",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Let's find your favorite shoes",
              style: subtitleTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                pageProvider.currentIndex = 0;
              },
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              child: Text(
                "Explore Store",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
          children: wishlistProvider.wishlist
              .map((product) => WishlistCard(
                    product: product,
                  ))
              .toList());
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: appBar(),
      body: Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: wishlistProvider.wishlist.length == 0 ? emptyState() : content(),
      ),
    );
  }
}
