sealed class SearchEvent {
  const SearchEvent();
}

class SearchItem extends SearchEvent {
  final String query;
  SearchItem({required this.query});
}

class SearchClear extends SearchEvent {}
