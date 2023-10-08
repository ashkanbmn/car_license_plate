import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

/// This class represents a widget for displaying and inputting car license plate information.
class CarLicensePlate extends StatefulWidget {
  // Indicates whether the widget is in input mode or not.
  final bool isInputType;

  // The city number for non-input mode.
  final String? noneInputCityNumber;

  // The two-number section for non-input mode.
  final String? noneInputTwoNumberSection;

  // The three-number section for non-input mode.
  final String? noneInputThreeNumberSection;

  // The alphabet section for non-input mode.
  final String? noneInputAlphabetSection;

  // A TextFormField widget for entering the city number (in input mode).
  final TextFormField? inputCityNumberTextFormField;

  // A TextFormField widget for entering the two-number section (in input mode).
  final TextFormField? inputTwoNumberSectionTextFormField;

  // A TextFormField widget for entering the three-number section (in input mode).
  final TextFormField? inputThreeNumberSectionTextFormField;

  // A function to show a dynamic bottom sheet.
  final Function(BuildContext)? modalBottomSheet;

  // The picked Persian word.
  final String? pickedPersianWord;

  /// Create a [CarLicensePlate] widget.
  ///
  /// [isInputType]: Indicates whether the widget is in input mode or not.
  /// [noneInputCityNumber]: The city number for non-input mode.
  /// [noneInputTwoNumberSection]: The two-number section for non-input mode.
  /// [noneInputThreeNumberSection]: The three-number section for non-input mode.
  /// [noneInputAlphabetSection]: The alphabet section for non-input mode.
  /// [inputCityNumberTextFormField]: A [TextFormField] widget for entering the city number (in input mode).
  /// [inputTwoNumberSectionTextFormField]: A [TextFormField] widget for entering the two-number section (in input mode).
  /// [inputThreeNumberSectionTextFormField]: A [TextFormField] widget for entering the three-number section (in input mode).
  /// [modalBottomSheet]: A function to show a dynamic bottom sheet.
  /// [pickedPersianWord]: The picked Persian word.
  const CarLicensePlate({
    Key? key,
    required this.isInputType,
    this.noneInputCityNumber,
    this.noneInputTwoNumberSection,
    this.noneInputThreeNumberSection,
    this.noneInputAlphabetSection,
    this.inputCityNumberTextFormField,
    this.inputTwoNumberSectionTextFormField,
    this.inputThreeNumberSectionTextFormField,
    this.modalBottomSheet,
    this.pickedPersianWord,
  }) : super(key: key);

  /// State class for [CarLicensePlate].
  @override
  _CarLicensePlateState createState() => _CarLicensePlateState();
}

/// The state class for the [CarLicensePlate] widget.
class _CarLicensePlateState extends State<CarLicensePlate> {
  @override
  Widget build(BuildContext context) {
    return widget.isInputType
        ? Stack(
            children: [
              // Container displaying the license plate image.
              Container(
                margin: const EdgeInsets.all(16),
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
                        child: widget.inputCityNumberTextFormField,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: widget.inputCityNumberTextFormField!,
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
                                    setState(() {
                                      widget.modalBottomSheet!(context);
                                    });
                                  },
                                  child: widget.pickedPersianWord == "معلولین"
                                      ? Image.asset(
                                          "assets/image/disabled.png",
                                          height: 36,
                                          width: 36,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.black
                                              : Colors.white,
                                        )
                                      : Text(
                                          widget.pickedPersianWord!,
                                          style: TextStyle(
                                            fontSize: 28,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white,
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
                      child: widget.inputThreeNumberSectionTextFormField!,
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
            // Display non-input mode license plate information.
            alphabetSection: widget.noneInputAlphabetSection ?? "",
            cityNumberSection: widget.noneInputCityNumber ?? "",
            threeNumberSection: widget.noneInputThreeNumberSection ?? "",
            twoNumberSection: widget.noneInputTwoNumberSection ?? "",
          );
  }
}

/// A widget for displaying vehicle license plate information.
class VehiclePlateInfoWidget extends StatelessWidget {
  final String cityNumberSection;
  final String twoNumberSection;
  final String threeNumberSection;
  final String alphabetSection;

  VehiclePlateInfoWidget(
      {required this.cityNumberSection,
      required this.twoNumberSection,
      required this.threeNumberSection,
      required this.alphabetSection});

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
                      numberFormat.format(int.tryParse(cityNumberSection)),
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
                          numberFormat.format(int.tryParse(threeNumberSection)),
                          style: const TextStyle(fontSize: 16),
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(width: 5),
                        alphabetSection == "معلولین"
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
                          numberFormat.format(int.tryParse(twoNumberSection)),
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
