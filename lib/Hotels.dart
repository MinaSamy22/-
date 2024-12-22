import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class HotelsPage extends StatefulWidget {
  const HotelsPage({super.key});

  @override
  _HotelsPageState createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  String selectedLocation = 'All Locations';

  final List<Map<String, String>> hotels = [
    {
      'imagePath': 'assets/images/hotel1.jpg',
      'name': 'The St.Regis Cairo',
      'description': 'Location: Cairo\nTel: +20 2-2597 9000',
      'rating': '4.6',
      'url': 'https://www.marriott.com/ar/hotels/caixr-the-st-regis-cairo/overview/',
      'location': 'Cairo',
    },
    {
      'imagePath': 'assets/images/hotel 2.jpg',
      'name': 'Nile Riverside Inn',
      'description': 'Location: Cairo\nTel: +20 2-2577 8899',
      'rating': '4.5',
      'url': 'https://www.ritzcarlton.com/en/hotels/cairz-the-nile-ritz-carlton-cairo/overview/',
      'location': 'Cairo',
    },
    {
      'imagePath': 'assets/images/hotel 3.jpg',
      'name': 'Sheraton Cairo Hotel & Casino',
      'description': 'Location: Cairo\nTel: +20 2-33369800',
      'rating': '4.4',
      'url': 'https://www.marriott.com/ar/hotels/caisi-sheraton-cairo-hotel-and-casino/overview/',
      'location': 'Cairo',
    },
    {
      'imagePath': 'assets/images/hotel 4.jpg',
      'name': 'Marriott Mena House, Cairo',
      'description': 'Location: Cairo\nTel: +20 2-3377-3222',
      'rating': '4.4',
      'url': 'https://www.marriott.com/ar/hotels/caimn-marriott-mena-house-cairo/overview/',
      'location': 'Cairo',
    },
    {
      'imagePath': 'assets/images/hotel 5.jpg',
      'name': 'Le Méridien Pyramids Hotel & Spa',
      'description': 'Location: Cairo\nTel: +20 2-33777070',
      'rating': '4.0',
      'url': 'https://www.marriott.com/ar/hotels/caimd-le-meridien-pyramids-hotel-and-spa/overview/',
      'location': 'Cairo',
    },
    {
      'imagePath': 'assets/images/hotel 11.jpg',
      'name': 'MÖVENPICK ASWAN',
      'description': 'Location: Aswan\nTel: +20 972454455',
      'rating': '5.0',
      'url': 'https://movenpick.accor.com/en/africa/egypt/aswan/resort-aswan.html?merchantid=seo-maps-EG-B4L1&sourceid=aw-cen&utm_medium=seo+maps&utm_source=google+Maps&utm_campaign=seo+maps&utm_content=Aswan',
      'location': 'Aswan',
    },
    {
      'imagePath': 'assets/images/hotel 12.jpg',
      'name': 'Kato Dool Wellness Resort',
      'description': 'Location: Aswan\nTel: +201067557225',
      'rating': '4.0',
      'url': 'https://lh3.googleusercontent.com/p/AF1QipNptCJQ8EFC1YGmmhytixCn4m1YBgOdJHm31R7c=s1360-w1360-h1020',
      'location': 'Aswan',
    },
    {
      'imagePath': 'assets/images/hotel 13.jpg',
      'name': 'Obelisk Nile Hotel Aswan',
      'description': 'Location: Aswan\nTel: +200972454100',
      'rating': '4.0',
      'url': 'https://images.trvl-media.com/lodging/3000000/2600000/2591200/2591199/92d23694.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill',
      'location': 'Aswan',
    },
    {
      'imagePath': 'assets/images/hotel 14.jpg',
      'name': 'Azal Lagoons Resort Abu Simbel',
      'description': 'Location: Aswan\nTel: +201111343242',
      'rating': '3.0',
      'url': 'https://azallagoons.com/',
      'location': 'Aswan',
    },
    {
      'imagePath': 'assets/images/hotel 15.jpg',
      'name': 'DoubleTree by Hilton Sharm El Sheikh - Sharks Bay Resort',
      'description': 'Location: Sharm El Sheikh\nTel: 069 3628000',
      'rating': '4.7',
      'url': 'https://www.hilton.com/en/hotels/sshsbdi-doubletree-sharm-el-sheikh-sharks-bay-resort/?SEO_id=GMB-EMEA-DI-SSHSBDI',
      'location': 'Sharm El Sheikh',
    },
    {
      'imagePath': 'assets/images/hotel 16.jpg',
      'name': 'White Hills Resort',
      'description': 'Location: Sharm El Sheikh\nTel: 069 3605380',
      'rating': '4.5',
      'url': 'https://www.whitehills-resorts.com/',
      'location': 'Sharm El Sheikh',
    },
    {
      'imagePath': 'assets/images/hotel 17.jpg',
      'name': 'Mövenpick Sharm El Sheikh',
      'description': 'Location: Sharm El Sheikh\nTel: 069 3600081',
      'rating': '5.0',
      'url': 'https://movenpick.accor.com/en/africa/egypt/sharm-el-sheikh/resort-sharm-el-sheikh.html?merchantid=seo-maps-EG-B4L5&sourceid=aw-cen&utm_medium=seo+maps&utm_source=google+Maps&utm_campaign=seo+maps&utm_content=Sharm-El-Sheik',
      'location': 'Sharm El Sheikh',
    },
    {
      'imagePath': 'assets/images/hotel 18.jpg',
      'name': 'Sunrise Remal Beach Resort',
      'description': 'Location: Sharm El Sheikh\nTel: 069 3670000',
      'rating': '5.0',
      'url': 'https://www.sunrise-resorts.com/remal-beach-resort',
      'location': 'Sharm El Sheikh',
    },
    {
      'imagePath': 'assets/images/hotel 19.jpg',
      'name': 'Savoy Sharm El Sheikh',
      'description': 'Location: Sharm El Sheikh\nTel: 069 3602500',
      'rating': '5.0',
      'url': 'https://www.savoy-sharm.com/savoy?utm_campaign=gmb&utm_content=savoy&utm_medium=mybusiness&utm_source=google',
      'location': 'Sharm El Sheikh',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredHotels = selectedLocation == 'All Locations'
        ? hotels
        : hotels.where((hotel) => hotel['location'] == selectedLocation).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels'),
        actions: [
          DropdownButton<String>(
            value: selectedLocation,
            icon: const Icon(Icons.filter_alt),
            elevation: 16,
            onChanged: (String? newValue) {
              setState(() {
                selectedLocation = newValue!;
              });
            },
            items: <String>['All Locations', 'Cairo', 'Aswan', 'Sharm El Sheikh']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: filteredHotels.map((hotel) {
          return _buildHotelCard(
            context,
            imagePath: hotel['imagePath']!,
            name: hotel['name']!,
            description: hotel['description']!,
            rating: double.parse(hotel['rating']!),
            url: hotel['url']!,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildHotelCard(
      BuildContext context, {
        required String imagePath,
        required String name,
        required String description,
        required double rating,
        required String url,
      }) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              bottomLeft: Radius.circular(12.0),
            ),
            child: Image.asset(
              imagePath,
              width: 130,
              height: 130,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 130,
                height: 130,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                _buildRatingRow(rating),
                const SizedBox(height: 8),
                _buildDescription(description),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      _openURL(url);
                    },
                    child: const Text(
                      'Visit',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingRow(double rating) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 20.0,
            );
          }),
        ),
        const SizedBox(width: 8),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
    );
  }

  // Updated _openURL method using url_launcher
  void _openURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
