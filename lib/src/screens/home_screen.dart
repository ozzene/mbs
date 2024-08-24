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
      appBar: AppBar(
        title: const Text(
          'Hi, Atta',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Implement search action here
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
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
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildBestSalonService() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Best Salon Service',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(5, (index) {
              return _buildSalonCard('ABC Hair Saloon', 'Bun Cut', 3.6);
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildSalonCard(String title, String subtitle, double rating,
      {Color color = Colors.white}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
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
        const Text(
          'Choose Your Barber',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) {
              return _buildBarberAvatar('John Doe');
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildBarberAvatar(String name) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
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
        const Text(
          'Popular Category',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
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
                  children: List.generate(5, (index) {
                    return const Icon(Icons.star,
                        color: Colors.yellow, size: 16);
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
