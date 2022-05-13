import 'package:calendar_tp/screens/add_group_screen/add_group_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../project_utils/controllers/rx_menu.dart';
import '../project_utils/pj_colors.dart';
import '../project_utils/pj_icons.dart';
import '../screens/profile_feed_screen/profile_feed_screen_provider.dart';

class PjBottomNavBar extends StatefulWidget {
  const PjBottomNavBar({Key? key}) : super(key: key);

  @override
  _PjBottomNavBarState createState() => _PjBottomNavBarState();
}

class _PjBottomNavBarState extends State<PjBottomNavBar> {
  RxMenu menuController = Get.find(tag: 'menu');
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
      child: BottomNavigationBar(
        selectedItemColor: PjColors.selectedItem,
        enableFeedback: false,
        items: [
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.only(top: 15.w),
            child: SvgPicture.asset(PjIcons.calendar, color: PjColors.navBarGrey,),
          ), label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset(PjIcons.notes, color: PjColors.navBarGrey,), label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset(PjIcons.notification, color: PjColors.navBarGrey), label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset(PjIcons.setting, color: PjColors.navBarGrey), label: ''),
        ],
        onTap: (index) {
          menuController.updateIndex(index);
        },
      ),
    );
  }
}
