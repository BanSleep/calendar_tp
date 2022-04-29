import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_new_group_screen.dart';
import 'cubit/cb_add_new_group_screen.dart';
import 'cubit/st_add_new_group_screen.dart';

class AddNewGroupScreenProvider extends StatelessWidget {
  const AddNewGroupScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbAddNewGroupScreen>(
      create: (context) => CbAddNewGroupScreen(),
      child: const AddNewGroupScreen(),
    );
  }
}    
    