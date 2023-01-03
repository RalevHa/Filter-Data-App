import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanawat_filter/controller/cart_controller.dart';
import 'package:thanawat_filter/controller/case_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final caseController = Get.put(CaseController());

  final cartController = Get.put(CartController());

  void updateList(String keyword) {
    setState(() {
      caseController.display_list = caseController.items
          .where((element) =>
              (element.title).toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Thanawat Filter'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.filter_list_alt),
            onPressed: (() {}),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size(3, 50),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(7),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: TextFormField(
                    controller: caseController.searchController,
                    onFieldSubmitted: (value) => updateList(value),
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GetX<CaseController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.display_list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                child: Image.asset(
                                  controller.display_list[index].image,
                                  scale: 5,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        caseController
                                            .display_list[index].title,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        caseController
                                            .display_list[index].brand,
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${caseController.display_list[index].price} ฿',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController.addToCard(
                                      controller.display_list[index]);
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
