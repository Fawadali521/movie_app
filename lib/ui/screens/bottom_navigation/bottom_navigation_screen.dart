import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/ui/screens/bottom_navigation/bottom_navigation_view_model.dart';
import 'package:movie_app/ui/screens/watch/watch_screen.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationViewModel(),
      child: Consumer<BottomNavigationViewModel>(
        builder: (context, model, child) => Scaffold(
          body: const WatchScreen(),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
            child: BottomNavigationBar(
              backgroundColor: kpingColor,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              currentIndex: model.selectedIndex,
              onTap: model.onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.movie),
                  label: 'Watch',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library),
                  label: 'Media Library',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: 'More',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
