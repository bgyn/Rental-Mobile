import 'package:flutter/material.dart';

@immutable
sealed class ListingEvent {}

class ListingFetch extends ListingEvent {
  ListingFetch();
}

class ListingDelete extends ListingEvent {
  final int id;

  ListingDelete(this.id);
}
