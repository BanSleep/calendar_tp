import 'package:calendar_tp/project_widgets/pj_bottom_nav_bar.dart';
import 'package:calendar_tp/screens/add_new_group_screen/add_new_group_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_tp/project_utils/pj_utils.dart';
import 'package:calendar_tp/project_widgets/pj_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../profile_feed_screen/profile_feed_screen_provider.dart';
import 'cubit/cb_add_group_screen.dart';
import 'cubit/st_add_group_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
      

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({Key? key}) : super(key: key);

  @override
  _AddGroupScreenState createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  List<bool> list = List.filled(2, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CbAddGroupScreen, StAddGroupScreen>(
        builder: (context, state){
          if(state is StAddGroupScreenLoading){
            BlocProvider.of<CbAddGroupScreen>(context).getData();
            return const Center(child: CupertinoActivityIndicator(),);
          }
          if(state is StAddGroupScreenLoaded){
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 20.w, left: 15.w, right: 7.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 276.w,
                          height: 28.w,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              hoverColor: PjColors.contGrey,
                              fillColor: PjColors.contGrey,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12.w),

                              )
                            ),
                          ),
                        ),
                        SizedBox(width: 6.w,),
                        Container(
                          width: 69.w,
                          height: 28.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: PjColors.black,),
                            borderRadius: BorderRadius.circular(12.w),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(AddNewGroupScreenProvider());
                            },
                            child: Text(
                              '+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: PjColors.black,
                                fontSize: 24.w,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.w,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 2,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      list[index] = !list[index];
                                    });
                                  },
                                  child: Container(
                                    height: list[index] == true ? 300.w : 90.w,
                                    width: context.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: PjColors.contGrey
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(11.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Название группы $index', style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.w500),),
                                          SizedBox(height: 10.w,),
                                          Text('Дата $index', style: TextStyle(fontSize: 15.w, fontWeight: FontWeight.w400),),
                                          SizedBox(height: 10.w,),
                                          if (list[index] == true) ...[
                                            for (int i = 0; i < 4; i++) ...[

                                              Container(
                                                width: 338.w,
                                                height: 44.w,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: PjColors.grey227,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(left: 10.w, top: 10.w),
                                                  child: Text(
                                                    'Фамилия Имя',
                                                    style: TextStyle(
                                                        fontSize: 15.w
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10.w,),
                                            ]
                                          ]
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.w,),
                              ],
                            );
                          },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if(state is StAddGroupScreenError){
            return Container(color: Colors.red);
          }
          return Container(color: Colors.grey);
        },
      ),
    );
      
  }
}
    