import 'package:flutter/material.dart';


class CategoryScreen extends StatelessWidget {
  // List of categories
  final List<Map<String, String>> categories = [
    {'name': 'DOG', 'image': 'lib/assets/images/dog_icon.jpg'},
    {'name': 'CAT', 'image': 'lib/assets/images/cat_icon.jpg'},
    {'name': 'FISH', 'image': 'lib/assets/images/fish_icon.jpg'},
    {'name': 'VITAMINS & SUPPLEMENTS', 'image': 'lib/assets/images/vitamins_icon.jpg'},
    {'name': 'GROOMING', 'image': 'lib/assets/images/grooming_icon.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    // Determine if dark mode is active
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for products...',
                  hintStyle: TextStyle(color: isDarkMode ? Colors.white60 : Colors.grey[600]),
                  prefixIcon: Icon(Icons.search, color: isDarkMode ? Colors.white : Colors.black),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 0.9, // Aspect ratio for circular images with text
          ),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(categories[index]['image']!),
                  backgroundColor: Colors.transparent, // Transparent background for images
                ),
                SizedBox(height: 10),
                Text(
                  categories[index]['name']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
