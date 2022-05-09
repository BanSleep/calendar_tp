import 'package:calendar_tp/project_utils/controllers/rx_menu.dart';
import 'package:calendar_tp/project_utils/pj_const.dart';
import 'package:calendar_tp/project_widgets/pj_bottom_nav_bar.dart';
import 'package:calendar_tp/screens/add_group_screen/add_group_screen_provider.dart';
import 'package:calendar_tp/screens/profile_feed_screen/profile_feed_screen_provider.dart';
import 'package:calendar_tp/screens/registration_screen/registration_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:eticon_api/eticon_api.dart';
import 'screens/main_screen/main_screen_provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  GetStorage().write(PjConst.THEME, false);
  Api.init(
      baseUrl:
          'https://your_api.com/api/v1/'); //Input your URL. Learn more eticon_api on pub.dev
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key) {
    Get.put<RxMenu>(RxMenu(initIndex: 0), tag: 'menu');
  }


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), //Default size of Iphone XR and 11
      builder: (context) => const GetCupertinoApp(
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: NavigationScreen(),
      ),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  RxMenu menuController = Get.find(tag: 'menu');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PjBottomNavBar(),
      body: Obx(
          () {
            switch (menuController.currentIndex.value) {
              case 0:
                return MainScreenProvider();
              case 1:
                return AddGroupScreenProvider();
              case 2:
                return Container();
              case 3:
                return ProfileFeedScreenProvider();
            }
            return Container();
          }
      ),
    );
  }
}

  