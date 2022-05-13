import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_tp/project_utils/pj_utils.dart';
import 'package:calendar_tp/project_widgets/pj_widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'cubit/cb_add_new_group_screen.dart';
import 'cubit/st_add_new_group_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
      

class AddNewGroupScreen extends StatefulWidget {
  const AddNewGroupScreen({Key? key}) : super(key: key);

  @override
  _AddNewGroupScreenState createState() => _AddNewGroupScreenState();
}

class _AddNewGroupScreenState extends State<AddNewGroupScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<CbAddNewGroupScreen, StAddNewGroupScreen>(
        builder: (context, state){
          if(state is StAddNewGroupScreenLoading){
            return const Center(child: CupertinoActivityIndicator(),);
          }
          if(state is StAddNewGroupScreenLoaded){
            return SafeArea(
              child: Column(
                children: [
                  Center(child: Text('Создание новой группы', style: TextStyle(fontSize: 22.w),),),
                  SizedBox(height: 75.w,),
                  Container(
                    width: 326.w,
                    height: 35.w,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Название группы',
                        labelStyle: TextStyle(
                            color: PjColors.navBarGrey
                        ),
                        contentPadding: EdgeInsets.only(top: 3.w, left: 4.w),
                        hintText: 'Введите название',
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
                  SizedBox(height: 15.w,),
                  Container(
                    width: 326.w,
                    height: 60.w,
                    child: TextFormField(
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        helperText: 'Макс: 4 участника',
                          labelText: 'Макс. кол-во участников',
                          labelStyle: TextStyle(
                              color: PjColors.navBarGrey
                          ),
                          contentPadding: EdgeInsets.only(top: 3.w, left: 4.w),
                          hintText: 'Введите число участников',
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
                  SizedBox(height: 40.w,),
                  Container(
                    width: context.width - 50.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: PjColors.contGrey,
                    ),
                    child: Center(child: Text('Готово', style: TextStyle(fontSize: 20.w),),),
                  )
                ],
              ),
            );
          }
          if(state is StAddNewGroupScreenError){
            return Container(color: Colors.red);
          }
          return Container(color: Colors.grey);
        },
      ),
    );
      
  }
}
    