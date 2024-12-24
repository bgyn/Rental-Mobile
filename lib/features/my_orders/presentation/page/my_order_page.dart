import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/features/my_orders/presentation/bloc/my_order_bloc.dart';
import 'package:rentpal/features/my_orders/presentation/bloc/my_order_event.dart';
import 'package:rentpal/features/my_orders/presentation/bloc/my_order_state.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyOrderPage> {
  @override
  void initState() {
    super.initState();
    context.read<MyOrderBloc>().add(GetOrders());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My orders'),
      ),
      body: BlocBuilder<MyOrderBloc, MyOrderState>(builder: (context, state) {
        if (state is MyOrderLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorPalette.primaryColor,
            ),
          );
        }
        if (state is MyOrderError) {
          return Center(child: Text(state.errorMessage!));
        }
        if (state is MyOrderSuccess) {
          if (state.data?.isEmpty ?? true) {
            return const Center(
              child: Text('No Orders Available!'),
            );
          }
          return ListView.builder(
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1,
                        color: state.data![index].status == 'pending'
                            ? Colors.amber
                            : state.data![index].status == 'completed'
                                ? Colors.green
                                : ColorPalette.errorColor,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(200)),
                                color: state.data![index].status == 'pending'
                                    ? Colors.amber
                                    : state.data![index].status == 'completed'
                                        ? Colors.green
                                        : ColorPalette.errorColor,
                              ),
                              child: Text(index.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500)),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    state.data![index].title.toString(),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    state.data![index].status.toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Rs. ${state.data![index].totalPrice.toString()}',
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                );
              });
        }
        return const SizedBox();
      }),
    );
  }
}
