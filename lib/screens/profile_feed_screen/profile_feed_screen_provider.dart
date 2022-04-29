import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_feed_screen.dart';
import 'cubit/cb_profile_feed_screen.dart';
import 'cubit/st_profile_feed_screen.dart';

class ProfileFeedScreenProvider extends StatelessWidget {
  const ProfileFeedScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbProfileFeedScreen>(
      create: (context) => CbProfileFeedScreen(),
      child: const ProfileFeedScreen(),
    );
  }
}    
    