import 'package:flutter/material.dart';
import 'package:youtube_clone/pages/home.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      //Compile time constants
      actions: const [
        Icon(
          Icons.cast,
          //color: Colors.black,
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.notifications,
          //color: Colors.black,
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.search,
          //color: Colors.black,
        ),
        SizedBox(
          width: 50,
        )
      ],
      //you can also you transparent
      backgroundColor: Colors.transparent,
      title: SizedBox(
        height: 150,
        child: Image.network(
            'https://logodownload.org/wp-content/uploads/2014/10/youtube-logo-0.png'),
      ),
    );
  }

  List<BottomNavigationBarItem> _getItems() {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //BottomNavigationBarItem(icon: Icon(Icons.videocam), label: 'Shorts'),
      BottomNavigationBarItem(
          icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
      BottomNavigationBarItem(icon: Icon(Icons.library_add), label: 'Library'),
    ];
  }

  List<Widget> _screens() {
    return [Home(), Text('Subscriptions'), Text('Library')];
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens()[index],
      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int currentIndex) {
            index = currentIndex;
            //to reflect the index on screen
            //When you call setState
            //This tells it is the time to rerender the UI
            //When you call setState Build state calls again
            setState(() {});
          },
          currentIndex: index,
          items: _getItems()),
    );
  }
}
