import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final Function(String) onCategorySelected;
  final String selectedCategory;
  final List<String> categories;

  CustomChip({
    required this.onCategorySelected,
    required this.selectedCategory,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories.map((genre) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ChoiceChip(
            label: Text(genre),
            selected: selectedCategory == genre,
            onSelected: (bool selected) {
              onCategorySelected(genre);
            },
            selectedColor: Colors.amber,
            backgroundColor: Colors.grey[850],
            labelStyle: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );
  }
}
