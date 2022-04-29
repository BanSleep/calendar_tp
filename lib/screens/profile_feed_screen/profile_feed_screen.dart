import 'dart:ui';

import 'package:calendar_tp/project_widgets/pj_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_tp/project_utils/pj_utils.dart';
import 'package:calendar_tp/project_widgets/pj_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../profile_screen/profile_screen_provider.dart';
import 'cubit/cb_profile_feed_screen.dart';
import 'cubit/st_profile_feed_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
      

class ProfileFeedScreen extends StatefulWidget {
  const ProfileFeedScreen({Key? key}) : super(key: key);

  @override
  _ProfileFeedScreenState createState() => _ProfileFeedScreenState();
}

class _ProfileFeedScreenState extends State<ProfileFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CbProfileFeedScreen, StProfileFeedScreen>(
          builder: (context, state){
            if(state is StProfileFeedScreenLoading){
              return const Center(child: CupertinoActivityIndicator(),);
            }
            if(state is StProfileFeedScreenLoaded){
              return Padding(
                padding: EdgeInsets.all(5.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(ProfileScreenProvider());
                      },
                      child: Container(
                        height: 181,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: PjColors.contGrey,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 141,
                                height: 141,
                                decoration: BoxDecoration(
                                  color: PjColors.navBarGrey,
                                  borderRadius: BorderRadius.circular(6.w)
                                ),
                                child: Center(
                                  child: SvgPicture.asset(PjIcons.profile,),
                                ),
                              ),
                              Flexible(child: Text('Фамилия Имя Отчество', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400), textAlign: TextAlign.center,))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.w,),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            height: 181.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: PjColors.contGrey,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 13.w, top: 13.w, bottom: 13.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.w),
                                    child: SvgPicture.asset(PjIcons.moon),
                                  ),
                                  Text('Темная \nтема', style: TextStyle(fontSize: 21.w, fontWeight: FontWeight.w400))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        Flexible(
                          child: Container(
                            height: 181.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: PjColors.contGrey,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 13.w, top: 13.w, bottom: 13.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Купить \nподписку', style: TextStyle(fontSize: 21.w, fontWeight: FontWeight.w400)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 40.w),
                                    child: Text(r'$', style: TextStyle(fontSize: 94.w, fontWeight: FontWeight.w600),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
            if(state is StProfileFeedScreenError){
              return Container(color: Colors.red);
            }
            return Container(color: Colors.grey);
          },
        ),
      ),
    );
      
  }
}
    