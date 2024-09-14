import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentpal/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rentpal/features/home/dummy_model.dart';
import 'package:rentpal/features/home/presentation/widgets/rental_category.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  static final List<String> rentalRules = <String>[
    'No late returns',
    'Must be verified rentpal profile',
    'Must be cleaned before returned',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              toolbarHeight: 40,
              floating: true,
              backgroundColor: Colors.blue,
              elevation: 1,
              surfaceTintColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                )
              ],
              expandedHeight: 0,
            )
          ],
          body: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: product.img[0],
                          placeholder: (context, url) {
                            return SizedBox(
                              width: double.infinity,
                              height: 300,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.white,
                                child: Container(
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.white),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.title),
                            Text(product.location),
                            const Text('No reviews')
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Rentals listed by Andrew"),
                                    Text("Sell all 60 of Andrew's listing"),
                                  ],
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue, width: 2),
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(50)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        color: Colors.white,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Description"),
                            Text(
                              overflow: TextOverflow.clip,
                              product.description,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Rental Rules"),
                            ...rentalRules.map((rules) => ListTile(
                                  dense: true,
                                  visualDensity: VisualDensity.compact,
                                  leading: const Icon(
                                    Icons.circle,
                                    size: 5,
                                  ),
                                  title: Text(rules),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Other listing by Andrew"),
                            const RentalCategory(),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                ),
                                child: const Center(
                                    child: Text("See all Andrews's listing")),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: const RentalCategory(
                          title: "Similiar Listing",
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        color: Colors.white,
                        width: double.infinity,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Cancellation Policy"),
                            Text(
                                "Cancel more than [number] days before the date for a full refund. Cancellations within [number] days but more than [number] hours before receive [percentage]% back. No refunds within [number] hours.To cancel, use our website/app, call [phone number], or email [email address]. Refunds may take [number] days. Service fees are non-refundable.")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border.fromBorderSide(BorderSide(color: Colors.grey))),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Type a message",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16.0)),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "\$${product.price}",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: const [
                          TextSpan(
                              text: " /day",
                              style: TextStyle(fontWeight: FontWeight.normal))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Colors.blue,
                              elevation: 0,
                              shadowColor: Colors.transparent),
                          onPressed: () {
                            state.isLoggedIn == true
                                ? null
                                : GoRouter.of(context).push('/signin');
                          },
                          child: const Text(
                            "Choose your date",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                )
              ],
            ),
          );
        }));
  }
}
