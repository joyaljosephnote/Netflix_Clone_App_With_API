import 'package:flutter/material.dart';
import 'package:netflix_clone_app/presentation/downloads/downloads_screen.dart';
import 'package:netflix_clone_app/presentation/fast_laugh/screen_fast_laught.dart';
import 'package:netflix_clone_app/presentation/home/screen_home.dart';
import 'package:netflix_clone_app/presentation/main_page/widget/bottom_nav.dart';
import 'package:netflix_clone_app/presentation/new_and_hot/screen_new_hot.dart';
import 'package:netflix_clone_app/presentation/search/screen_search.dart';

class MainPageScreen extends StatelessWidget {
  MainPageScreen({super.key});
  final List pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: bottomNavigationNotifier,
          builder: (context, int index, child) {
            return pages[index];
          },
        ),
        bottomNavigationBar: const BottomNavigationWidget(),
      ),
    );
  }
}
