import 'package:flutter/material.dart';

PreferredSizeWidget appBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80.0),
    child: AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient:
              LinearGradient(colors: [Color(0xFF273C4F), Color(0xFF517DA0)]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 160,
              height: 65,
            ),
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 95,
            ),
            IconButton(
              iconSize: 35,
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              //style: const ButtonStyle(iconColor: Colors.black),
            )
          ],
        ),
      ),
    ),
  );
}

PreferredSizeWidget appBar1() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80.0),
    child: AppBar(
      automaticallyImplyLeading: true,
      flexibleSpace: Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient:
              LinearGradient(colors: [Color(0xFF273C4F), Color(0xFF517DA0)]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 160,
              height: 65,
            ),
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 95,
            ),
            IconButton(
              iconSize: 35,
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              //style: const ButtonStyle(iconColor: Colors.black),
            )
          ],
        ),
      ),
    ),
  );
}
