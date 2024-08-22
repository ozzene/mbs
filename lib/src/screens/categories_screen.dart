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
              title: const Text('Categories', style: TextStyle(fontSize: 18,color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildGenderOptionRow(),
              const SizedBox(height: 20),
              _buildCategoryCard('Medium Length', 'Male'),
              const SizedBox(height: 10),
              _buildCategoryCard('Bun Cut', 'Male'),
              const SizedBox(height: 10),
              _buildCategoryCard('French Crop', 'Male'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderOptionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildGenderOption('Male'),
        _buildGenderOption('Female'),
      ],
    );
  }

  Widget _buildGenderOption(String gender) {
    return ChoiceChip(
      label: Text(gender),
      selected: _selectedGender == gender,
      onSelected: (bool selected) {
        setState(() {
          _selectedGender = gender;
        });
      },
      selectedColor: const Color.fromARGB(255, 0, 0, 0),
      backgroundColor: Colors.grey.shade200,
      labelStyle: TextStyle(
        color: _selectedGender == gender ? Colors.white : Colors.black,
      ),
    );
  }

  Widget _buildCategoryCard(String title, String gender) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(gender),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('View Shop'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  height: 100,
                  color: Colors.grey.shade300, // Placeholder for image
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
