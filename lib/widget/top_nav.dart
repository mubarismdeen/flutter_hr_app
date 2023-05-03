import 'package:admin/constants/style.dart';
import 'package:admin/helpers/responsiveness.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Icon(
                    Icons.cabin_outlined,
                    size: 25,
                    color: darke,
                  ),
                )
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu_outlined),
              onPressed: () {
                key.currentState?.openDrawer();
              }),
      elevation: 0,
      title: Wrap(children: [
        Row(
          children: [
            const Visibility(
                child: Text(
              'HR Mate',
              style: TextStyle(
                  color: darke,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LobsterFont'),
            )),
            Expanded(child: Container()),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: lightGrey.withOpacity(.7),
              ),
              onPressed: () {},
            ),
            Stack(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: lightGrey.withOpacity(.7),
                    ),
                    onPressed: () {}),
                Positioned(
                    top: 7,
                    right: 7,
                    child: Container(
                      width: 8,
                      height: 12,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: active,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: light, width: 2)),
                    ))
              ],
            ),
            Container(
              width: 1,
              height: 22,
              color: lightGrey,
            ),
            const SizedBox(
              width: 5,
            ),
            const CustomText(
                text: "Master User",
                size: 16,
                color: lightGrey,
                weight: FontWeight.bold),
            const SizedBox(
              width: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.all(2),
                child: const CircleAvatar(
                  backgroundColor: light,
                  child: Icon(
                    Icons.person_outline,
                    color: lightGrey,
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
      iconTheme: const IconThemeData(color: lightGrey),
      backgroundColor: Colors.transparent,
    );
