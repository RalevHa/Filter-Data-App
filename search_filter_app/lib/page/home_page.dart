import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('iPhone Case Shop'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: <Color>[
                  Colors.blue,
                  Colors.deepPurple,
                ]),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (() {
              Get.toNamed('/add');
            }),
          ),
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
                      caseController.getKeyword = value;
                      caseController.onSelectCate(value);
                    }),
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon:
                          caseController.searchController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () => setState(() {
                                        caseController.searchController.clear();
                                        caseController.getKeyword = '';
                                        caseController.onSelectCate(
                                            caseController.getKeyword);
                                      }),
                                  icon: const Icon(Icons.clear))
                              : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: GradientBackground(
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.deepPurple],
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3)),
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(3),
                child: GetX<CaseController>(
                  builder: (controller) {
                    return Text(
                      'ขณะสินค้าแสดงผลอยู่ ${caseController.displaylist.length} รายการ',
                      style: const TextStyle(fontSize: 18),
                    );
                  },
                ),
              ),
              Expanded(
                child: GetX<CaseController>(
                  builder: (controller) {
                    return (caseController.displaylist.isEmpty)
                        ? Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.all(3),
                                child: const Text(
                                  'ไม่พบสินค้าที่ท่านกำลังค้นหา\nกรุณาลองใหม่อีกครั้ง',
                                  style: TextStyle(fontSize: 26),
                                  textAlign: TextAlign.center,
                                )),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
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
                                        child: CachedNetworkImage(
                                          imageUrl: caseController
                                              .displaylist[index].image,
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Shimmer.fromColors(
                                            highlightColor: Colors.white,
                                            baseColor: Colors.grey.shade300,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10.0)),
                                                child: AspectRatio(
                                                  aspectRatio: 1 / 1,
                                                  child: Container(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
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
                                              SizedBox(
                                                width: size.width * 0.6,
                                                child: Text(
                                                  caseController
                                                      .displaylist[index].title,
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.6,
                                                child: Text(
                                                  'Brand: ${caseController.displaylist[index].brand}',
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.6,
                                                child: Text(
                                                  'For: ${caseController.displaylist[index].version}',
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.6,
                                                child: Text(
                                                  'Color: ${caseController.displaylist[index].color}',
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '${caseController.displaylist[index].price} ฿',
                                            style:
                                                const TextStyle(fontSize: 24),
                                          ),
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          cartController.addToCard(
                                              controller.displaylist[index]);
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(
          builder: (controller) {
            return Row(
              children: <Widget>[
                Text(
                  '${controller.totalPrice} ฿ | ',
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text(
                  controller.count.toString(),
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            );
          },
        ),
        icon: const Icon(
          Icons.shopping_basket,
          color: Colors.white,
        ),
      ),
    );
  }
}

class GradientBackground extends StatelessWidget {
  GradientBackground({key, required this.gradient, required this.child})
      : super(key: key);
  final Gradient gradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: gradient,
          ),
        ),
        child,
      ],
    );
  }
}
