import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanawat_filter/controller/case_controller.dart';
import 'package:thanawat_filter/models/brand_model.dart';
import 'package:thanawat_filter/models/color_model.dart';
import 'package:thanawat_filter/models/version_model.dart';

typedef UpdateDataCallback = void Function(List<BrandModel> selectedBrands);

class FilterPage extends StatefulWidget {
  FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

final caseController = Get.put(CaseController());
List<bool> _checkboxValuesBrand = List.filled(BrandModel.brands.length, false);

List<bool> _checkboxValuesColor = List.filled(ColorModel.colors.length, false);

List<bool> _checkboxValuesVersion =
    List.filled(VersionModel.versions.length, false);

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
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
                Get.back();
                caseController.onSelectCate(caseController.getKeyword);
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
                Text(
                  'Brand',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                CustomBrandFilter(brands: BrandModel.brands),
                Text(
                  'Color',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                CustomColorFilter(colors: ColorModel.colors),
                Text(
                  'Generation',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                CustomVersionFilter(versions: VersionModel.versions),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class CustomBrandFilter extends StatefulWidget {
  late List<BrandModel> brands;
  CustomBrandFilter({Key? key, required this.brands}) : super(key: key);

  @override
  State<CustomBrandFilter> createState() => _CustomBrandFilterState();
}

class _CustomBrandFilterState extends State<CustomBrandFilter> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.brands.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.brands[index].brand),
              SizedBox(
                height: 25,
                child: Checkbox(
                  value: _checkboxValuesBrand[index],
                  onChanged: (bool? value) {
                    setState(
                      () {
                        for (int i = 0; i < _checkboxValuesBrand.length; i++) {
                          _checkboxValuesBrand[i] = false;
                        }
                        _checkboxValuesBrand[index] = value ?? false;
                        if (value == false) {
                          caseController.selectBrands = 0;
                        } else {
                          caseController.selectBrands = widget.brands[index].id;
                        }
                        // caseController.onCategories();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomColorFilter extends StatefulWidget {
  late List<ColorModel> colors;
  CustomColorFilter({Key? key, required this.colors}) : super(key: key);

  @override
  State<CustomColorFilter> createState() => _CustomColorFilterState();
}

class _CustomColorFilterState extends State<CustomColorFilter> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.colors.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.colors[index].color),
              SizedBox(
                height: 25,
                child: Checkbox(
                  value: _checkboxValuesColor[index],
                  onChanged: (bool? value) {
                    setState(
                      () {
                        for (int i = 0; i < _checkboxValuesColor.length; i++) {
                          _checkboxValuesColor[i] = false;
                        }
                        _checkboxValuesColor[index] = value ?? false;
                        if (value == false) {
                          caseController.selectColor = 0;
                        } else {
                          caseController.selectColor = widget.colors[index].id;
                        }
                        // caseController.onCategories();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomVersionFilter extends StatefulWidget {
  late List<VersionModel> versions;
  CustomVersionFilter({Key? key, required this.versions}) : super(key: key);

  @override
  State<CustomVersionFilter> createState() => _CustomVersionFilterState();
}

class _CustomVersionFilterState extends State<CustomVersionFilter> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.versions.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.versions[index].version),
              SizedBox(
                height: 25,
                child: Checkbox(
                  value: _checkboxValuesVersion[index],
                  onChanged: (bool? value) {
                    setState(
                      () {
                        for (int i = 0;
                            i < _checkboxValuesVersion.length;
                            i++) {
                          _checkboxValuesVersion[i] = false;
                        }
                        _checkboxValuesVersion[index] = value ?? false;
                        if (value == false) {
                          caseController.selectVersion = 0;
                        } else {
                          caseController.selectVersion =
                              widget.versions[index].id;
                        }
                        // caseController.onCategories();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
