import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class CarLicensePlate extends StatefulWidget {
  final bool isInputType;
  final String? noneInputCityNumber;
  final String? noneInputTwoNumberSection;
  final String? noneInputThreeNumberSection;
  final String? noneInputAlphabetSection;

  const CarLicensePlate({

    super.key,
    required this.isInputType,
    this.noneInputCityNumber,
    this.noneInputTwoNumberSection,
    this.noneInputThreeNumberSection,
    this.noneInputAlphabetSection,
  });

  @override
  _CarLicensePlateState createState() => _CarLicensePlateState();
}

class _CarLicensePlateState extends State<CarLicensePlate> {
  TextEditingController cityNumberController = TextEditingController();
  TextEditingController twoNumberSectionController = TextEditingController();
  TextEditingController threeNumberSectionController = TextEditingController();
  String dropdownValue = 'الف'; // Default value
  String faWordInput = "";

  @override
  Widget build(BuildContext context) {
    return widget.isInputType == true
        ? Stack(
      children: [
        Container(
          color: Theme.of(context).colorScheme.surface,
          margin: const EdgeInsets.all(18),
          child: Image.asset(
            "assets/image/${Theme.of(context).brightness == Brightness.light ? "plate_iran_transparent" : "plate_iran_white"}.png",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: TextFormField(
                    controller: cityNumberController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "- -",
                      hintStyle: TextStyle(fontSize: 30, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: TextFormField(
                  controller: twoNumberSectionController,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "- - -",
                    hintStyle: TextStyle(fontSize: 30, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: SizedBox(
                    child: SizedBox(
                      height: 65,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextButton(
                            onPressed: () {
                              showBottomSheet(context);
                            },
                            child: dropdownValue == "معلولین" || dropdownValue == "Disabled People"
                                ? Image.asset(
                              "assets/image/disabled.png",
                              height: 36,
                              width: 36,
                              color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                            )
                                : Text(
                              dropdownValue,
                              style: TextStyle(
                                fontSize: 28,
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: threeNumberSectionController,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "- -",
                    hintStyle: TextStyle(fontSize: 30, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ],
    )
        : VehiclePlateInfoWidget(
      alphabetSection: widget.noneInputAlphabetSection ?? "",
      cityNumberController: widget.noneInputCityNumber ?? "",
      threeNumberSectionController: widget.noneInputThreeNumberSection ?? "",
      twoNumberSectionController: widget.noneInputTwoNumberSection ?? "",
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          child: Container(
            color: Theme.of(context).brightness == Brightness.light ? HexColor("#F8F8F8") : HexColor("#272727"),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: GridView.count(
                crossAxisCount: 4, // Number of columns
                childAspectRatio: 2.35, // Width-to-height ratio of each item
                children: faWords.map<Widget>((String value) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        dropdownValue = value;
                        faWordInput = value;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(8.0),
                      child: Text(value),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  List<String> faWords = ['الف', 'ب', 'پ', 'ت', 'ث', 'ج', 'چ', 'ح', 'خ', 'د', 'ذ', 'ر', 'ز', 'ژ', 'س', 'ش', 'ص', 'ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق', 'ک', 'گ', 'ل', 'م', 'ن', 'و', 'ه', 'ی', 'معلولین'];

  @override
  void dispose() {
    cityNumberController.dispose();
    twoNumberSectionController.dispose();
    threeNumberSectionController.dispose();
    super.dispose();
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

class VehiclePlateInfoWidget extends StatelessWidget {
  final String cityNumberController;
  final String twoNumberSectionController;
  final String threeNumberSectionController;
  final String alphabetSection;

  VehiclePlateInfoWidget({required this.cityNumberController, required this.twoNumberSectionController, required this.threeNumberSectionController, required this.alphabetSection});

  @override
  Widget build(BuildContext context) {
    final numberFormat = intl.NumberFormat('#,###');
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/image/${Theme.of(context).brightness == Brightness.light ? "plate_iran_transparent" : "plate_iran_white"}.png",
          width: 200,
          height: 50,
        ),
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.only(top: 8, left: 8),
            alignment: Alignment.center,
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                  child: Center(
                    child: Text(
                      numberFormat.format(int.tryParse(cityNumberController)),
                      style: const TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                SizedBox(
                  width: 120,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          numberFormat.format(int.tryParse(twoNumberSectionController)),
                          style: const TextStyle(fontSize: 16),
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(width: 5),
                        alphabetSection == "معلولین" || alphabetSection == "Disabled People"
                            ? Image.asset(
                          "assets/image/disabled.png",
                          height: 16,
                          width: 16,
                        )
                            : Text(
                          "$alphabetSection",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          isNumeric(threeNumberSectionController) ? numberFormat.format(int.tryParse(threeNumberSectionController)) : "",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

// Helper function for isNumeric
bool isNumeric(String? str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}
