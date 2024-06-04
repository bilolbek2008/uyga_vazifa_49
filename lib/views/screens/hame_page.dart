import 'package:flutter/material.dart';
import 'package:uyga_vazifa_49/views/screens/page2.dart';

import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    Home(),
    SummaryPage(),
    Center(
      child:Text("Profil Sahifa"),

    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: Colors.grey[200],
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(
                  Icons.home,
                ),
                label: Text("Home"),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.bar_chart,
                ),
                label: Text("Reyting"),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.person,
                ),
                label: Text("Person"),
              ),
            ],
          ),
          Expanded(
            child: screens[_selectedIndex], //RELOAD  usuli
            // child: IndexedStack(
            //   //IndexedStack   usuli
            //   index: _selectedIndex,
            //   children: screens,
            // ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Reyting",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}








/*


*/