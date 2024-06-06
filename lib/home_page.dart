import 'package:flutter/material.dart';
import 'imports.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<String> postImages = [
    "https://images.unsplash.com/photo-1502680390469-be75c86b636f?auto=format&fit=crop&q=80&w=870&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1530870110042-98b2cb110834?auto=format&fit=crop&q=80&w=870&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1505459668311-8dfac7952bf0?auto=format&fit=crop&q=80&w=870&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1455264745730-cb3b76250ae8?auto=format&fit=crop&q=80&w=844&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1535182463927-440364075d9c?auto=format&fit=crop&q=80&w=872&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];
  final List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _widgetOptions.add(HomePage(postImages: postImages));
    _widgetOptions.add(const ProfilePage());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zeymur Blog'),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> postImages;

  const HomePage({super.key, required this.postImages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildActivityButtons(context),
          ),
        ),
        Expanded(child: _buildBlogList()),
      ],
    );
  }

  List<Widget> _buildActivityButtons(BuildContext context) {
    return [
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SurfingPage()));
        },
        child: const Column(
          children: [
            Icon(Icons.surfing, size: 40),
            Text('Surfing'),
          ],
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SailingPage()));
        },
        child: const Column(
          children: [
            Icon(Icons.directions_boat, size: 40),
            Text('Sailing'),
          ],
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BasketballPage()));
        },
        child: const Column(
          children: [
            Icon(Icons.sports_basketball, size: 40),
            Text('Basketball'),
          ],
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TennisPage()));
        },
        child: const Column(
          children: [
            Icon(Icons.sports_tennis, size: 40),
            Text('Tennis'),
          ],
        ),
      ),
    ];
  }

  Widget _buildBlogList() {
    return ListView.builder(
      itemCount: postImages.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Image.network(postImages[index]),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text('Post Title Here',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Icon(Icons.thumb_up, color: Colors.blue),
                      SizedBox(width: 5),
                      Text('123'),
                      SizedBox(width: 10),
                      Icon(Icons.comment, color: Colors.blue),
                      SizedBox(width: 5),
                      Text('456'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SailingPage extends StatelessWidget {
  const SailingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sailing'),
      ),
      body: const Center(
        child: Text('Sailing Page Content'),
      ),
    );
  }
}

class BasketballPage extends StatelessWidget {
  const BasketballPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basketball'),
      ),
      body: const Center(
        child: Text('Basketball Page Content'),
      ),
    );
  }
}

class TennisPage extends StatelessWidget {
  const TennisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tennis'),
      ),
      body: const Center(
        child: Text('Tennis Page Content'),
      ),
    );
  }
}
