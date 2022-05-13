import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_group_screen.dart';
import 'cubit/cb_add_group_screen.dart';
import 'cubit/st_add_group_screen.dart';

class AddGroupScreenProvider extends StatelessWidget {
  const AddGroupScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbAddGroupScreen>(
      create: (context) => CbAddGroupScreen(),
      child: const AddGroupScreen(),
    );
  }
}    
    