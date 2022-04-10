import 'package:calendar_tp/project_widgets/pj_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../project_utils/pj_colors.dart';

class PjButton extends StatefulWidget {
  final Function() onTap;
  const PjButton({Key? key, required this.onTap}) : super(key: key);

  @override
  _PjButtonState createState() => _PjButtonState();
}

class _PjButtonState extends State<PjButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: widget.onTap, child: Container(
      width: 143.w,
      height: 32.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: PjColors.blue,
      ),
      child: Center(child: PjText(text: 'Войти', color: PjColors.black,)),
    ));
  }
}
