import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_1/home.dart';
import 'package:week_1/provider_data.dart';

class DescriptionData extends StatelessWidget {
  const DescriptionData({super.key, required this.title, required this.image, required this.description});

  final String title;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const home()),
              (route) => false,
            );
          },
        ),
        title: const Text('Description'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Consumer<provider_data>(
              builder: (context, provider, child) {
                return IconButton(
                  icon: Builder(builder: (context) {
                    if (provider.like == false) {
                      return const Icon(
                        Icons.favorite_border,
                        color: Color.fromARGB(69, 3, 168, 244),
                      );
                    } else {
                      return const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      );
                    }
                  }),
                  onPressed: () {
                    provider.change();
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
