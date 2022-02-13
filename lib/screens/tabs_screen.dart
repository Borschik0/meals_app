import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';

import '../widgets/main_drawer.dart';
import 'favorites_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({required this.favoriteMeals, Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories'
      },
      {
        'page':  FavoritesScreen(favoriteMeals: widget.favoriteMeals),
        'title': 'Your Favorite'
      }
    ];
    // TODO: implement initState
    super.initState();
  }
  void _selectedPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(_pages[_selectedPageIndex]['title'] as String)),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.category), label:'Category', backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(icon: const Icon(Icons.star), label: 'Favorites', backgroundColor: Theme.of(context).primaryColor)
        ],
      ),
    );
  }
}
