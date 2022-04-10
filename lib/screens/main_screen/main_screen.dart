import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_tp/project_utils/pj_utils.dart';
import 'package:calendar_tp/project_widgets/pj_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'cubit/cb_main_screen.dart';
import 'cubit/st_main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
      

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PjAppBar(),
      body: BlocBuilder<CbMainScreen, StMainScreen>(
        builder: (context, state){
          if(state is StMainScreenLoading){
            return const Center(child: CupertinoActivityIndicator(),);
          }
          if(state is StMainScreenLoaded){
            return Container(color: Colors.green);
          }
          if(state is StMainScreenError){
            return Container(color: Colors.red);
          }
          return Container(color: Colors.grey);
        },
      ),
    );
      
  }
}
    