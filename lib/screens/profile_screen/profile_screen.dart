import 'package:calendar_tp/project_widgets/pj_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_tp/project_utils/pj_utils.dart';
import 'package:calendar_tp/project_widgets/pj_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'cubit/cb_profile_screen.dart';
import 'cubit/st_profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
      

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: PjBottomNavBar(),
      body: BlocBuilder<CbProfileScreen, StProfileScreen>(
        builder: (context, state){
          if(state is StProfileScreenLoading){
            return const Center(child: CupertinoActivityIndicator(),);
          }
          if(state is StProfileScreenLoaded){
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        Center(child: Text('Профиль', style: TextStyle(fontSize: 24.w),)),
                      ],
                    ),
                    SizedBox(height: 50.w,),
                    Text('Имя: Фамилия Имя Отчество', style: TextStyle(fontSize: 24.w),),
                    SizedBox(height: 25.w,),
                    Text('email: test@mail.ru', style: TextStyle(fontSize: 24.w),),
                    SizedBox(height: 25.w,),
                    Row(
                      children: [
                        Text('Пароль: ********', style: TextStyle(fontSize: 24.w),),
                        SizedBox(width: 5.w,),
                        SvgPicture.asset(PjIcons.eye),
                      ],
                    ),
                    SizedBox(height: 70.w,),
                    GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Container(
                          height: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: PjColors.editGrey,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
                            child: Text(
                              'Редактировать профиль',
                              style: TextStyle(fontSize: 24.w),
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            );
          }
          if(state is StProfileScreenError){
            return Container(color: Colors.red);
          }
          return Container(color: Colors.grey);
        },
      ),
    );
      
  }
}
    