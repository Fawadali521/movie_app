import 'package:movie_app/core/view_models/base_view_model.dart';

class BottomNavigationViewModel extends BaseViewModel {
  int selectedIndex = 1; 

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
