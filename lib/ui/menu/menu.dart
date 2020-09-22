import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zomato/ui/menu/menu_search.dart';
import 'package:zomato/ui/menu/menu_selected.dart';
import 'package:zomato/ui/menu/menu_shopping.dart';
import 'package:zomato/ui/menu/menu_unselected.dart';
import 'package:zomato/ui/menu/menu_windows.dart';
import 'package:zomato/ui/menu/svg.dart';


class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.string(
          svg_4uzea6,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: Column(
            children: [
              Expanded(
                child: MenuWindows(
                  onTap: _onTapWindows,
                ),
              ),
              Expanded(
                child: MenuSearch(
                  onTap: _onTapSearch,
                ),
              ),
              Expanded(
                child: MenuUnselected(
                  title: 'My  Profile',
                ),
              ),
              Expanded(
                child: MenuUnselected(
                  title: 'Notification',
                ),
              ),
              Expanded(
                child: MenuUnselected(
                  title: 'Invoice',
                ),
              ),
              Expanded(
                child: MenuSelected(
                  title: 'Home',
                ),
              ),
              Expanded(
                child: MenuShopping(
                  onTap: _onTapShopping,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onTapWindows() {}

  void _onTapSearch() {}

  void _onTapShopping() {}
}
