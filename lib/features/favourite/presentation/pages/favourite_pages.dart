import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/features/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:rentpal/features/favourite/presentation/bloc/favourite_event.dart';
import 'package:rentpal/features/favourite/presentation/bloc/favourite_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FavouritePages extends StatefulWidget {
  const FavouritePages({super.key});

  @override
  State<FavouritePages> createState() => _FavouritePagesState();
}

class _FavouritePagesState extends State<FavouritePages> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(const FavouriteLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite"),
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FavouriteError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }
          if (state is FavouriteLoaded) {
            return state.rentitems.isEmpty
                ? const Center(
                    child: Text("No favourites added yet."),
                  )
                : ListView.builder(
                    itemCount: state.rentitems.length,
                    itemBuilder: (context, index) {
                      final rentitem = state.rentitems[index];
                      return InkWell(
                        onTap: () {
                          context.push("/product-detail", extra: rentitem);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.hardEdge,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        rentitem.thumbnailImage.toString(),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                              title: Text(rentitem.title ?? "Unnamed Item"),
                              subtitle: Text(
                                  rentitem.description ?? "No description"),
                              trailing: IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  context.read<FavouriteBloc>().add(
                                        FavouriteRemove(rentitem.id!),
                                      );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
          }
          return const Center(
            child: Text("Welcome to Favourites"),
          );
        },
      ),
    );
  }
}
