import 'package:flutter/material.dart';

@immutable
sealed class ListingEvent {}

class ListingFetch extends ListingEvent {
  ListingFetch();
}
