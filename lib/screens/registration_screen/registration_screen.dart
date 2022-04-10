import 'package:calendar_tp/project_widgets/pj_button.dart';
import 'package:calendar_tp/screens/main_screen/main_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_tp/project_utils/pj_utils.dart';
import 'package:calendar_tp/project_widgets/pj_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'cubit/cb_registration_screen.dart';
import 'cubit/st_registration_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isTap = false;
  static const String PASS = '123';
  static const String LOGIN = 'test';
  bool _validPass = true;
  bool _validLogin = true;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _passController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PjColors.white,
      body: BlocBuilder<CbRegistrationScreen, StRegistrationScreen>(
        builder: (context, state) {
          if (state is StRegistrationScreenLoading) {
            BlocProvider.of<CbRegistrationScreen>(context).getData();
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is StRegistrationScreenLoaded) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PjText(
                    text: 'Вход',
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: PjColors.black,
                  ),
                  SizedBox(
                    height: 65.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65.w),
                    child: SizedBox(
                        height: 32.w,
                        child: CupertinoTextField(
                          style: TextStyle(color: PjColors.black),
                          controller: _controller,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: !_validLogin || !_validPass ? PjColors.wrongPass : PjColors.grey),
                          placeholder: 'Логин',
                          placeholderStyle: TextStyle(
                              fontSize: 14,
                              color: PjColors.black,
                              fontWeight: FontWeight.w400),
                          padding: EdgeInsets.only(
                              left: 15.w, right: 10.w, top: 5.w),
                        )),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65.w),
                    child: SizedBox(
                        height: 32.w,
                        child: CupertinoTextField(
                          style: TextStyle(color: PjColors.black),
                          controller: _passController,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: !_validLogin || !_validPass ? PjColors.wrongPass : PjColors.grey),
                          placeholder: 'Пароль',
                          placeholderStyle: TextStyle(
                              fontSize: 14,
                              color: PjColors.black,
                              fontWeight: FontWeight.w400),
                          padding: EdgeInsets.only(
                              left: 15.w, right: 10.w, top: 5.w),
                        )),
                  ),
                  if (!_validPass || !_validLogin) ... [
                    SizedBox(height: 10.w,),
                    PjText(text: 'Введен не верный логин или пароль', color: PjColors.red, fontSize: 12, fontWeight: FontWeight.w400,)
                  ],
                  SizedBox(
                    height: 10.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _isTap = !_isTap;
                            });
                          },
                          child: Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: PjColors.grey),
                            child: _isTap ? SvgPicture.asset(PjIcons.cross, width: 10.w, height: 10.w, fit: BoxFit.none, color: PjColors.black,) : null,
                          )),
                      SizedBox(
                        width: 14.w,
                      ),
                      PjText(
                        text: 'Запомнить данные входа',
                        color: PjColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.w,),
                  PjButton(onTap: () {
                    if(_controller.text == LOGIN && _passController.text == PASS) {
                      setState(() {
                        _validLogin = true;
                        _validPass = true;
                      });
                      Get.to(MainScreenProvider());
                    } else if (_controller.text != LOGIN) {
                      setState(() {
                        _validLogin = false;
                      });
                    } else if (_passController.text != PASS) {
                      setState(() {
                        _validPass = false;
                      });

                    }
                  },),
                ],
              ),
            );
          }
          if (state is StRegistrationScreenError) {
            return Container(color: Colors.red);
          }
          return Container(color: Colors.grey);
        },
      ),
    );
  }
}
