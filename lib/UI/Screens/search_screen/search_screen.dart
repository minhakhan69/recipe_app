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
      backgroundColor: Colors.white,
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
                    color: Colors.brown,
                  ),
                  hintText: 'search your recipe...',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.brown.shade900)),
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
