import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/model/user_model.dart';
import 'package:shamo/provider/auth_provider.dart';
import 'package:shamo/theme.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    PreferredSizeWidget header() {
      return AppBar(
        toolbarHeight: 87,
        backgroundColor: bgColor1,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close_rounded),
            ),
            Text(
              "Edit Profile",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.check_rounded,
                color: primaryColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget inputName() {
      return TextFormField(
        style: primaryTextStyle,
        decoration: InputDecoration(
            hintText: "${user.name}",
            hintStyle: primaryTextStyle,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: subtitleTextColor,
            ))),
      );
    }

    Widget inputUsername() {
      return TextFormField(
        style: primaryTextStyle,
        decoration: InputDecoration(
            hintText: "@${user.username}",
            hintStyle: primaryTextStyle,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: subtitleTextColor,
            ))),
      );
    }

    Widget inputEmail() {
      return TextFormField(
        style: primaryTextStyle,
        decoration: InputDecoration(
            hintText: "${user.email}",
            hintStyle: primaryTextStyle,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: subtitleTextColor,
            ))),
      );
    }

    Widget content() {
      return Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      user.profilePhotoUrl.toString(),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              )),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Name",
                style: subtitleTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              inputName(),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Username",
                style: subtitleTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              inputUsername(),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Email",
                style: subtitleTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              inputEmail(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
