import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  String _selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Gender', style: TextStyle(fontSize: 18)),
              Row(
                children: [
                  _buildGenderOption('Male'),
                  const SizedBox(width: 20),
                  _buildGenderOption('Female'),
                ],
              ),
              const SizedBox(height: 20),
              _buildCategoryCard('Medium Length', 'Male'),
              const SizedBox(height: 10),
              _buildCategoryCard('Bun Cut', 'Male'),
              const SizedBox(height: 10),
              _buildCategoryCard('French Crop', 'Male'),
              const SizedBox(height: 10),
              _buildAdCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender) {
    return Row(
      children: [
        Radio(
          value: gender,
          groupValue: _selectedGender,
          onChanged: (String? value) {
            setState(() {
              _selectedGender = value!;
            });
          },
        ),
        Text(gender),
      ],
    );
  }

  Widget _buildCategoryCard(String title, String gender) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.pink.shade50, Colors.grey.shade400],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(gender),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('View Shop'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.grey, // Placeholder for the image
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdCard() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(color: Colors.pink[200]), // Placeholder for ad image
          ),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Get Rid of Stubborn Fat Easily and...', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Sponsored by: Fat Removal-non-m', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     currentIndex: 2,
  //     type: BottomNavigationBarType.fixed,
  //     items: [
  //       const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
  //       const BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
  //       const BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Category'),
  //       const BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
  //       const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
  //     ],
  //   );
  // }
}