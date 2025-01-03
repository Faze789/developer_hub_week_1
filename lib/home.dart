import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week_1/description.dart';
import 'package:week_1/fetch_data.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();
    fetch_news();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App', style: GoogleFonts.roboto()),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetch_news(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: title.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionData(
                          title: title[index],
                          image: image[index],
                          description: description[index],
                        ),
                      ),
                      (route) => false,
                    );
                  },
                  child: ListTile(
                    leading: Image.network(image[index]),
                    title: Text(title[index], style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Author: ${author[index]}'),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
