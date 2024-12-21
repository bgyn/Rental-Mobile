import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/features/search/presentation/bloc/search_bloc.dart';
import 'package:rentpal/features/search/presentation/bloc/search_event.dart';
import 'package:rentpal/features/search/presentation/bloc/search_state.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final SearchBloc searchBloc;
  Timer? _debounce;

  CustomSearchDelegate(this.searchBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          searchBloc.add(SearchClear());
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        searchBloc.add(SearchClear());
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _triggerSearch(query);
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: searchBloc,
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          if (state.data.isEmpty) {
            return const Center(child: Text('No results found.'));
          }
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.data[index].title.toString()),
                // onTap: () {
                //   close(context, state.data[index].title.toString());
                // },
              );
            },
          );
        } else if (state is SearchError) {
          return const Center(
              child: Text("Type something to start searching."));
        } else {
          return const Center(child: Text('Start typing to search.'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Type something to start searching.'));
    }

    _triggerSearch(query);

    return BlocBuilder<SearchBloc, SearchState>(
      bloc: searchBloc,
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          if (state.data.isEmpty) {
            return const Center(child: Text('No suggestions available.'));
          }
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.data[index].title.toString()),
                onTap: () {
                  query = state.data[index].title.toString();
                  showResults(context);
                },
              );
            },
          );
        } else if (state is SearchError) {
          return Center(child: Text(state.err));
        } else {
          return const Center(
              child: Text('Type something to get suggestions.'));
        }
      },
    );
  }

  void _triggerSearch(String input) {
    // Cancel the previous debounce timer if still active
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    // Start a new debounce timer
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchBloc.add(SearchItem(query: input));
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
