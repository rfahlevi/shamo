import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/model/message_model.dart';
import 'package:shamo/model/product_model.dart';
import 'package:shamo/provider/auth_provider.dart';
import 'package:shamo/services/message_service.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_bubble.dart';

class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage({super.key, required this.product});

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async {
      await MessageService().addMessage(
        user: authProvider.user,
        isFromUser: true,
        product: widget.product,
        message: messageController.text.trim(),
      );

      setState(() {
        widget.product = UninitializedProductModel();
        messageController = TextEditingController();
      });
    }

    PreferredSize appBar() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          toolbarHeight: 70,
          backgroundColor: bgColor1,
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                'assets/image_shop_logo_online.png',
                width: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shoe Store",
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    "Online",
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              )
            ],
          ),
          centerTitle: false,
        ),
      );
    }

    Widget productPreview() {
      return Container(
        width: 225,
        height: 74,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(12),
          color: const Color(0XFF2B2844),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryTextColor,
                image: DecorationImage(
                    image: NetworkImage(widget.product.galleries![0].url!),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.product.name!,
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "\$${widget.product.price}",
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: Icon(
                  Icons.close_rounded,
                  color: bgColor1,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputChat() {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.product is UninitializedProductModel
                ? const SizedBox()
                : productPreview(),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 105,
                  height: 45,
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                    color: bgColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: messageController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Type your message here ...',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Container(
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.only(
                      top: 13,
                      right: 13,
                      bottom: 13,
                      left: 16,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/icon_submit.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      Stream<QuerySnapshot>? messageStream =
          MessageService().getMessagesByUserId(userId: authProvider.user.id);

      Stream<QuerySnapshot> postStream =
          FirebaseFirestore.instance.collection('messages').snapshots();
      print(messageStream);
      return StreamBuilder<QuerySnapshot>(
          stream: postStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children:
                    snapshot.data!.docs.map<Widget>((DocumentSnapshot message) {
                  Map<String, dynamic> data =
                      message.data()! as Map<String, dynamic>;
                  return ChatBubble(
                      isSender: data['isFromUser'],
                      text: data['message'],
                      product: ProductModel.fromJson(data['product']));
                  // ChatBubble(
                  //   isSender: message['isFromUser'],
                  //   text: message['message'],
                  //   product: ProductModel.fromJson(message['product']),
                  // );

                  // return ChatBubble(
                  //   isSender: message['isFromUser'],
                  //   text: message['message'],
                  //   product: ProductModel.fromJson(message['product']),
                  // );
                }).toList(),
              );
            } else {
              return Center(
                child: Text(
                  "Belum ada chat",
                  style: primaryTextStyle,
                ),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: appBar(),
      bottomNavigationBar: inputChat(),
      body: content(),
    );
  }
}
