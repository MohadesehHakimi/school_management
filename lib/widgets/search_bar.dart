import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Theme(
        data: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              fillColor: Colors.white,
            )
        ),
        child: Material(  // use material widget to add elevation
          elevation: 3.0,
          borderRadius: BorderRadius.circular(25.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
              filled: true,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25.0),
              ),
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
