import 'package:flutter/material.dart';
import 'ImageDetailScreen2.dart';
import 'ProfilePage.dart';
import 'Hotels.dart';
import 'ImageDetailScreen1.dart';

// Define the custom color globally, outside the widget classes
const Color customColor = Color(0xFF763A12); // Hex value for #763a12

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // List of screens for navigation
  final List<Widget> _pages = [
    const HomePage(),
    Center(child: Text('Scan Page', style: TextStyle(fontSize: 24))),
    const HotelsPage(),
    const ProfilePage(),
  ];

  final List<String> _titles = ['Home', 'Scan', 'Hotels', 'Profile'];
  final List<IconData> _icons = [
    Icons.home,
    Icons.camera_alt,
    Icons.hotel,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(
                _icons[_currentIndex],
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 8),
              Text(
                _titles[_currentIndex],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: customColor,
        centerTitle: false,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Scan'),
          BottomNavigationBarItem(icon: Icon(Icons.hotel), label: 'Hotels'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: customColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeMessage(),
            const SizedBox(height: 16),
            _buildSectionHeader('Top Places', null),
            _buildHorizontalImageList([
              'assets/images/haram.jpg',
              'assets/images/khan.jpg',
            ]),
            _buildSectionHeader('Renewed Places', 'assets/images/renew.jpg'),
            _buildHorizontalImageList([
              'assets/images/update 5.jpeg',
              'assets/images/update 2.jpg',
              'assets/images/update 3.jpg',
              'assets/images/update 4.jpg',
              'assets/images/update 1.jpeg',
            ]),
            _buildSectionHeader('Coming Soon', null),
            _buildHorizontalImageList([
              'assets/images/soon1.jpg',
              'assets/images/soon 3.jpg',
              'assets/images/soon 2.jpg',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    return Center(
      child: Text(
        'Welcome to Egypt 👋',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: customColor,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String? imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          if (imagePath != null)
            Image.asset(
              imagePath,
              width: 30,
              height: 30,
            )
          else
            Icon(Icons.place, color: customColor, size: 30),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalImageList(List<String> imagePaths) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return _buildImageCard(context, imagePaths[index]);
        },
      ),
    );
  }

  Widget _buildImageCard(BuildContext context, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageDetailScreen1(
                imagePath: imagePath,
                description: 'Detailed description goes here.',
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
