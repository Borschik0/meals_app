import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';

import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = const [
    {
      'page': CategoriesScreen(),
      'title': 'Categories'
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your Favorite'
    }
  ];
  int _selectedPageIndex = 0;
  void _selectedPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(_pages[_selectedPageIndex]['title'] as String)),
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
