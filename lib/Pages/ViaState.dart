import 'package:flutter/material.dart';

class ViaState extends StatefulWidget {
  const ViaState({super.key});

  @override
  State<ViaState> createState() => _ViaStateState();
}

class _ViaStateState extends State<ViaState> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(children: [
            Row(
              children: [],
            )
          ]),
        ),
      ),
    );
  }
}
