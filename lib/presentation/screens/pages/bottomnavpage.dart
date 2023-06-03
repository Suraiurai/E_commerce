import 'package:e_commerce_flutter/domain/blocs/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:e_commerce_flutter/presentation/screens/pages/exportpage.dart';
import 'package:e_commerce_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
 final List pages = [
    FirstPage(),
    CategoryPage(),
    BasketPage(),
    FavouritePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: pages[state.index],
          bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
            builder: (context, state) {
              return BottomNavigationBar(
                  selectedItemColor: ColorsUI.primaryColorFrave,
                  unselectedItemColor: Colors.grey.shade700,
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    context
                        .read<BottomNavBloc>()
                        .add(BottomNavTappedEvent(value));
                  },
                  currentIndex: state.index,
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.category_outlined), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shop_outlined), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_border_outlined), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline), label: ''),
                  ]);
            },
          ),
        );
      },
    );
  }
}
