import 'package:flutter/material.dart';
import 'package:mestrafacil/pages/PageView/fourPage.dart';
import 'package:mestrafacil/pages/PageView/onePage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  int indexBottomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ray'),
              accountEmail: Text('Ray@email.com'),
              currentAccountPicture: CircleAvatar(
                child: Text('R', style: TextStyle(fontSize: 27)),
                backgroundColor: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Page 1'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.animateToPage(
                  0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                Navigator.pop(context);
          setState(() {
            indexBottomNavigationBar = 0;
          });
              }
            ),
            ListTile(
              title: Text('Page 2'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                Navigator.pop(context);
                setState(() {
            indexBottomNavigationBar = 1;
          });
              },
            ),
            ListTile(
              title: Text('Page 3'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.animateToPage(
                  2,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                Navigator.pop(context);
                setState(() {
            indexBottomNavigationBar = 2;
          });
              },
            ),
            ListTile(
              title: Text('Incrementação'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.animateToPage(
                  3,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                Navigator.pop(context);
                setState(() {
            indexBottomNavigationBar = 3;
          });
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('AppBar'),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 30, color: Colors.white),
        backgroundColor: Colors.green,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          OnePage(),
          Container(color: Colors.red),
          Container(color: Colors.green),
          FourPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavigationBar,
        onTap: (int page) {
          setState(() {
            indexBottomNavigationBar = page;
          });
          _pageController.animateToPage(
            page,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.launch),
            label: 'Item 1',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.launch),
            label: 'Item 2',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.launch),
            label: 'Item 3',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Incrementação',
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
