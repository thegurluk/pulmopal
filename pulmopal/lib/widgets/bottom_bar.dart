import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulmopal/config/router/get_x.dart';
import 'package:pulmopal/pages/blog/blog_page.dart';
import 'package:pulmopal/pages/blog/blog_page_new.dart';
import 'package:pulmopal/pages/coin/main.dart';
import 'package:pulmopal/pages/home/home_page.dart';
import 'package:pulmopal/pages/remainder/remainder_page.dart';
import 'package:pulmopal/pages/settings/account_page.dart';

Widget bottomBar(BuildContext context) {
  GenelController controller = Get.find<GenelController>();
  return Obx(
    () => ConvexAppBar(
      items: const [
        TabItem(
          icon: Icons.mark_unread_chat_alt_outlined,
          title: 'Blog',
        ),
        TabItem(icon: Icons.calendar_month_outlined, title: 'Remainder'),
        TabItem(icon: Icons.home_filled, title: 'Home'),
        TabItem(icon: Icons.attach_money_rounded, title: 'Coin'),
        TabItem(icon: Icons.manage_accounts, title: 'Profile'),
      ],
      initialActiveIndex: controller.selectedPage.value,
      backgroundColor: const Color(0xFF273C4F),
      height: 65,
      onTap: (int i) {
        controller.selectedPage.value = i;
        if (i == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const BlogPageNew())));
        } else if (i == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const RemainderPage())));
        } else if (i == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const HomePage())));
        } else if (i == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const CoinPage())));
        } else if (i == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => AccountPage())));
        }
      },
    ),
  );
}
