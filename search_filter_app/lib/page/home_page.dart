import 'dart:async';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('iPhone Case Shop'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.filter_list_alt),
            onPressed: (() {
              Get.toNamed('/filter');
            }),
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
                    onChanged: (value) => setState(() {
                      caseController.updateList(value);
                    }),
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
                    itemCount: controller.displaylist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image.network(
                                      controller.displaylist[index].image)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        caseController.displaylist[index].title,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        'Brand: ${caseController.displaylist[index].brand}',
                                      ),
                                      Text(
                                        'For: ${caseController.displaylist[index].version}',
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${caseController.displaylist[index].price} ฿',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addToCard(controller.displaylist[index]);
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
            // GetX<CartController>(
            //   builder: (controller) {
            //     return Text(
            //       'Total amount: ${controller.totalPrice} ฿',
            //       style: const TextStyle(fontSize: 30, color: Colors.white),
            //     );
            //   },
            // ),
            // const SizedBox(
            //   height: 100,
            // )
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
