import 'package:flutter/material.dart';

class RentalPage extends StatelessWidget {
  const RentalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Rentals",
        ),
      ),
    );
  }
}
