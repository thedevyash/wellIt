import 'package:flutter/material.dart';
import 'package:wellit/Community/PostCard.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
          return PostCard();
        }),
      ),
    );
  }
}
