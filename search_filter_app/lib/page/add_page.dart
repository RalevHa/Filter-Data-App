import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thanawat_filter/controller/case_controller.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

List<String> brand_dropdown = ['Case-Mate', 'Otterbox', 'UAG'];
List<String> color_dropdown = ['Colorful', 'White', 'Black'];
List<String> version_dropdown = [
  'iPhone 14',
  'iPhone 14 Pro',
  'iPhone 14 Pro Max'
];

class _AddPageState extends State<AddPage> {
  final caseController = Get.put(CaseController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Case'),
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
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                caseController.addProduct(
                    title: caseController.titleController.text.trim(),
                    brand: caseController.brandController.text.trim(),
                    color: caseController.colorController.text.trim(),
                    version: caseController.versionController.text.trim(),
                    price:
                        int.parse(caseController.priceController.text.trim()),
                    pathImage: caseController.pathImageStore!);
              },
              child: const Text('Apply'))
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<CaseController>(builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: size.width,
                  height: size.height,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Text(
                        'Add New Case',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: caseController.titleController,
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.title),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Case Name',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(color: Colors.pink)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                              color: Colors.pink,
                            ),
                          ),
                          focusColor: Colors.pink,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: caseController.priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.price_change_outlined),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Price',
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(color: Colors.pink)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                              color: Colors.pink,
                            ),
                          ),
                          focusColor: Colors.pink,
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone_iphone_sharp),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          labelText: "Generation",
                        ),
                        items: version_dropdown
                            .map((value) => DropdownMenuItem<String>(
                                  child: Text(
                                    value,
                                  ),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (value) {
                          caseController.versionController.text = value!;
                        },
                        hint: const Text(
                          'Select Generation',
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.color_lens_outlined),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          labelText: "Color",
                        ),
                        items: color_dropdown
                            .map((value) => DropdownMenuItem<String>(
                                  child: Text(
                                    value,
                                  ),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (value) {
                          caseController.colorController.text = value!;
                        },
                        hint: const Text(
                          "Select Color",
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.card_travel_sharp),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          labelText: "Brand",
                        ),
                        items: brand_dropdown
                            .map((value) => DropdownMenuItem<String>(
                                  child: Text(
                                    value,
                                  ),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (value) {
                          caseController.brandController.text = value!;
                        },
                        hint: const Text(
                          "Select Brand",
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => caseController.chooseImage(
                            imageSource: ImageSource.gallery),
                        child: Container(
                          width: size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Colors.blue,
                                Colors.deepPurple,
                              ],
                            ),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                          ),
                          child: const Center(
                              child: Text(
                            'Select Image',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GetBuilder<CaseController>(builder: (_) {
                        if (caseController.image != null) {
                          return SizedBox(
                              width: size.width,
                              height: size.height * 0.3,
                              child: Image.file(caseController.image!));
                        } else {
                          return Container();
                        }
                      }),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
