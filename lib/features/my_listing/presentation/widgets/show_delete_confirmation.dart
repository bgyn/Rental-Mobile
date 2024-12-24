import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_bloc.dart';
import 'package:rentpal/features/my_listing/presentation/bloc/listing_event.dart';

void showDeleteConfirmationDialog(BuildContext context, int id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm Deletion"),
        content: const Text("Are you sure you want to delete this listing?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<ListingBloc>().add(ListingDelete(id));
            },
            child: const Text("Delete"),
          ),
        ],
      );
    },
  );
}
