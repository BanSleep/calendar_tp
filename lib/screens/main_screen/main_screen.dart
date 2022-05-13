import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_tp/project_utils/pj_utils.dart';
import 'package:calendar_tp/project_widgets/pj_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'cubit/cb_main_screen.dart';
import 'cubit/st_main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar_tp/project_utils/pj_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const PjAppBar(),
      body: BlocBuilder<CbMainScreen, StMainScreen>(
        builder: (context, state){
          if(state is StMainScreenLoading){
            return const Center(child: CupertinoActivityIndicator(),);
          }
          if(state is StMainScreenLoaded){
            return SafeArea(
              child: Column(
                children: <Widget>[
                  TableCalendar(
                    focusedDay: selectedDay,
                    firstDay: DateTime(1990),
                    lastDay: DateTime(2050),
                    startingDayOfWeek: StartingDayOfWeek.monday,

                    onDaySelected: (DateTime selectDay,DateTime focusDay){
                      setState(() {
                        selectedDay = selectDay;
                        focusedDay = focusDay;
                      });
                    },
                    selectedDayPredicate: (DateTime date){
                      return isSameDay(selectedDay,date);
                    },

                    daysOfWeekVisible: false,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                    ),
                    calendarStyle: CalendarStyle(

                      todayTextStyle: TextStyle(
                        color: PjColors.black,
                      ),
                      isTodayHighlighted: true,
                      todayDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: PjColors.blue,
                          width: 2,
                        ),
                      ),
                  
                      selectedDecoration: BoxDecoration(
                        color: PjColors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.w,),
                  Container(
                    alignment: Alignment.center,
                    width: 60.w,
                    height: 8.w,
                    decoration: BoxDecoration(
                        color: PjColors.black,
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                  SizedBox(height: 20.w,),
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 338.w,
                            height: 44.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: PjColors.grey227,
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(11.w),
                                child: Text('Событий нет', style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.w500),),
                            ),
                          ),
                          SizedBox(height: 10.w,),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 320.w,),
                          Container(
                            alignment: Alignment.bottomRight,
                            width: 50.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: PjColors.black,),
                            ),
                            child: GestureDetector(
                              child: Center(
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
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            );
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
    