import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.pinkAccent.withOpacity(0.06),
      body: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.pink,
                  ),
                  hintText: 'search your recipe...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
  Widget _buildUI(){
    return SizedBox.expand(
      child: Column(
        children: [

        ],
      ),
    );
  }
}
