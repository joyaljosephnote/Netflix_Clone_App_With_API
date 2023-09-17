import 'package:flutter/material.dart';
import 'package:netflix_clone_app/core/colors/colors.dart';
import 'package:netflix_clone_app/presentation/new_and_hot/widget/coming_soon_widget.dart';
import 'package:netflix_clone_app/presentation/new_and_hot/widget/everyones_watching_widget.dart';
import '../../core/constanst/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: AutofillHints.addressCity),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 28,
              ),
              kWidth10,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 28,
                    width: 28,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'),
                            fit: BoxFit.cover,
                            scale: 1)),
                  ),
                ],
              ),
              kWidth10
            ],
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: kWhiteColor,
              labelColor: kBlackColor,
              labelStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              indicator:
                  BoxDecoration(color: kWhiteColor, borderRadius: kRadius20),
              tabs: const [
                Tab(
                  text: "🍿 Coming soon",
                ),
                Tab(
                  text: "👀 Everyone's watching",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ValueListenableBuilder(
      valueListenable: upComingListNotifeir,
      builder: (context, value, _) {
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            var data = value[index];
            return ComingSoonWidget(
              movie: data,
            );
          },
        );
      },
    );
  }

  Widget _buildEveryonesWatching() {
    return ValueListenableBuilder(
        valueListenable: topRatedListNotifeir,
        builder: (context, value, _) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              var data = value[index];
              return EveryonesWatchingWidget(
                movie: data,
              );
            },
          );
        });
  }
}
