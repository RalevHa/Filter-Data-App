import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanawat_filter/controller/cart_controller.dart';
import 'package:thanawat_filter/controller/case_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final caseController = Get.put(CaseController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Thanawat Filter'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GetX<CaseController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Image.asset(controller.items[index].image),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        caseController.items[index].title,
                                        style: const TextStyle(fontSize: 20),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        caseController.items[index].brand,
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${caseController.items[index].price} ฿',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addToCard(controller.items[index]);
                                },
                                child: const Text('Add to Cart'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text(
                  'Total amount: ${controller.totalPrice} ฿',
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                );
              },
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              controller.count.toString(),
              style: const TextStyle(fontSize: 26, color: Colors.white),
            );
          },
        ),
        icon: const Icon(
          Icons.add_shopping_cart_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
