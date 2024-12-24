import 'package:flutter/material.dart';
import 'package:rentpal/core/extension/extension.dart';

void showUpdateStatusDialog(BuildContext context, String rentalTitle,
    String status, Function(String) onUpdate) {
  String? selectedStatus = status;
  final List<String> statuses = [
    "pending",
    "accepted",
    "notAccepted",
  ]; // Predefined statuses

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Update Status for $rentalTitle"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Select Status",
                border: OutlineInputBorder(),
              ),
              value: selectedStatus,
              items: statuses.map((status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Text("${status.capitalize()}"),
                );
              }).toList(),
              onChanged: (value) {
                selectedStatus = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedStatus != null) {
                onUpdate(selectedStatus!);
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please select a status")),
                );
              }
            },
            child: const Text(
              "Update",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
    },
  );
}
