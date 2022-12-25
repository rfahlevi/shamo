import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/model/user_model.dart';
import 'package:shamo/provider/auth_provider.dart';
import 'package:shamo/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor1,
        elevation: 0,
        toolbarHeight: 124,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      user.profilePhotoUrl.toString(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hallo, ${user.name}",
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    "@${user.username}",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
                child: Image.asset(
                  'assets/button_exit.png',
                  width: 20,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: subtitleTextStyle.copyWith(fontSize: 13),
            ),
            Image.asset(
              'assets/icon_next.png',
              height: 16,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding:
              EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20),
          decoration: BoxDecoration(
            color: bgColor3,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                  child: menuItem(
                    "Edit Profile",
                  ),
                ),
                menuItem(
                  "Your Orders",
                ),
                menuItem(
                  "Help",
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "General",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                menuItem(
                  "Privacy & Policy",
                ),
                menuItem(
                  "Term of Service",
                ),
                menuItem(
                  "Rate App",
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
