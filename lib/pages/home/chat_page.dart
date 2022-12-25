import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/model/product_model.dart';
import 'package:shamo/pages/home/detail_chat_page.dart';
import 'package:shamo/provider/page_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget appBar() {
      return AppBar(
        title: Text(
          "Message Support",
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
        toolbarHeight: 80,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: bgColor1,
        elevation: 0,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: bgColor3,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_headset.png',
                  width: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Opss no message yet?",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "You have never done a transaction",
                  style: subtitleTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    pageProvider.currentIndex = 0;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 24),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Explore Store",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DetailChatPage(
                product: UninitializedProductModel(),
              );
            },
          )),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: bgColor3,
            ),
            child: ListView(
              children: const [
                ChatTile(),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        appBar(),
        content(),
      ],
    );
  }
}
