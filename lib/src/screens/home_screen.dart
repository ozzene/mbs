import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
                _buildHeader(),
            Expanded(
              child: ListView(
                children: [Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildBestSalonService(),
                      const SizedBox(height: 20),
                      _buildChooseYourBarber(),
                      const SizedBox(height: 20),
                      _buildPopularCategory(),
                    ],
                  ),
                ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(0.0),
      topRight: Radius.circular(0.0),
      bottomLeft: Radius.circular(30.0),
      bottomRight: Radius.circular(30.0),), // Adjust the radius as needed
      child: Container(
        color: Colors.amber,
        height: 100,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi, Atta', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10,),
                  Text('Good Afternoon',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text('A', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBestSalonService() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Best Salon Service',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('View All', style: TextStyle(color: Colors.blue)),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          physics: const  BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ["", "", "", "", ""]
                .asMap()
                .entries
                .map((e) => _buildSalonCard('ABC Hair Saloon', 'Bun Cut', 3.6))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSalonCard(String title, String subtitle, double rating,
      {Color color = Colors.white}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text('$rating'),
                  const Spacer(),
                  const Text('OPEN', style: TextStyle(color: Colors.green)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChooseYourBarber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Choose Your Barber',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('View All', style: TextStyle(color: Colors.blue)),
          ],
        ),
        const SizedBox(height: 10),
       SingleChildScrollView(
          physics: const  BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ["", "", "", "", "","", "", "", "", ""]
                .asMap()
                .entries
                .map((e) => _buildBarberAvatar('John Deo'))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBarberAvatar(String name) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/5,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPopularCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Popular Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                const Text('ABC Hair Saloon',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('OPEN', style: TextStyle(color: Colors.green)),
                const Text('9:30 AM - 6:30 PM'),
                const Text('Bun Cut'),
                const Text('Price ₹250'),
                Row(
                    children: List.generate(
                        5,
                        (index) => const Icon(Icons.star,
                            color: Colors.yellow, size: 16))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
