import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';
import 'package:spotifyclone/common/widgets/appbar/app_bar.dart';
import 'package:spotifyclone/core/configs/assets/app_images.dart';
import 'package:spotifyclone/core/configs/assets/app_vectors.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/presentation/home/widgets/news_songs.dart';
import 'package:spotifyclone/presentation/home/widgets/playlist.dart';
import 'package:spotifyclone/presentation/profile/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppbar(
          action: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => const ProfilePage())
                );
              },
              icon: const Icon(
                  Icons.person
              )
          ),
          hideBack: true,
          title: SvgPicture.asset(
            AppVectors.logo,
            height: 40,
            width: 40,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _artistImageCard(),
              _tabs(),
              Container(
                height: 260,
                padding: const EdgeInsets.only(left: 10),
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    NewsSongs(),
                    NewsSongs(),
                    NewsSongs(),
                    NewsSongs(),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const PlayList(),
            ],
          ),
        ));
  }

  Widget _artistImageCard() {
    return Center(
      child: SizedBox(
        height: 130,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.homeTopCard,height: 200,),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Image.asset(AppImages.homeTopArtist),
                ))
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
        controller: _tabController,
        isScrollable: true,
        dividerHeight: 0,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 5),
        tabs: const [
          Text(
            'News',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18
            ),
          ),
          Text(
            'Videos',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18
            ),
          ),
          Text(
            'Artists',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18
            ),
          ),
          Text(
            'Podcasts',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18
            ),
          )
        ]);
  }
}
