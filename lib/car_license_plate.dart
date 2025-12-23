library car_license_plate;

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

/// Main widget for showing or inputting an Iranian car license plate.
class CarLicensePlate extends StatelessWidget {
  final bool isInputType;
  final String cityNumber;
  final String twoNumberSection;
  final String threeNumberSection;
  final String alphabetSection;
  final ValueChanged<String>? onCityNumberChanged;
  final ValueChanged<String>? onTwoNumberChanged;
  final ValueChanged<String>? onThreeNumberChanged;
  final VoidCallback? onAlphabetTap;

  /// Developer override for text size
  final double? textSize;

  /// Use Persian numbers (true) or English numbers (false)
  final bool usePersianNumbers;

  /// Custom width for the license plate (if null, uses constraints)
  final double? width;

  const CarLicensePlate({
    super.key,
    this.isInputType = false,
    this.cityNumber = '',
    this.twoNumberSection = '',
    this.threeNumberSection = '',
    this.alphabetSection = '',
    this.onCityNumberChanged,
    this.onTwoNumberChanged,
    this.onThreeNumberChanged,
    this.onAlphabetTap,
    this.textSize,
    this.usePersianNumbers = false,
    this.width,
  }) : assert(
  !isInputType ||
      (onCityNumberChanged != null &&
          onTwoNumberChanged != null &&
          onThreeNumberChanged != null &&
          onAlphabetTap != null),
  'All callbacks must be provided when isInputType = true',
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double effectiveWidth = width ?? min(constraints.maxWidth, 360.0);

        final double effectiveTextSize = textSize ?? _calculateTextSize(effectiveWidth);

        return _PlateContainer(
          width: effectiveWidth,
          effectiveTextSize: effectiveTextSize,
          isInputType: isInputType,
          cityNumber: cityNumber,
          twoNumber: twoNumberSection,
          threeNumber: threeNumberSection,
          alphabet: alphabetSection,
          onCityNumberChanged: onCityNumberChanged,
          onTwoNumberChanged: onTwoNumberChanged,
          onThreeNumberChanged: onThreeNumberChanged,
          onAlphabetTap: onAlphabetTap,
          usePersianNumbers: usePersianNumbers,
        );
      },
    );
  }

  /// Calculate text size based on width with better scaling for small widths
  double _calculateTextSize(double width) {
    if (width <= 150) {
      return width * 0.050;
    } else if (width <= 200) {
      return width * 0.052;
    } else if (width <= 250) {
      return width * 0.055;
    } else if (width <= 300) {
      return width * 0.058;
    } else {
      return width * 0.065;
    }
  }
}

class _PlateContainer extends StatelessWidget {
  final double width;
  final double effectiveTextSize;
  final bool isInputType;
  final String cityNumber;
  final String twoNumber;
  final String threeNumber;
  final String alphabet;
  final ValueChanged<String>? onCityNumberChanged;
  final ValueChanged<String>? onTwoNumberChanged;
  final ValueChanged<String>? onThreeNumberChanged;
  final VoidCallback? onAlphabetTap;
  final bool usePersianNumbers;

  const _PlateContainer({
    required this.width,
    required this.effectiveTextSize,
    required this.isInputType,
    required this.cityNumber,
    required this.twoNumber,
    required this.threeNumber,
    required this.alphabet,
    this.onCityNumberChanged,
    this.onTwoNumberChanged,
    this.onThreeNumberChanged,
    this.onAlphabetTap,
    required this.usePersianNumbers,
  });

  String _plateImage(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? 'assets/images/plate_iran_transparent.png'
        : 'assets/images/plate_iran_white.png';
  }

  /// Calculate spacing based on width - smaller widths get proportionally less spacing
  double _calculateSpacing() {
    if (width <= 150) {
      return width * 0.008;
    } else if (width <= 200) {
      return width * 0.010;
    } else if (width <= 250) {
      return width * 0.012;
    } else if (width <= 300) {
      return width * 0.015;
    } else {
      return width * 0.020;
    }
  }

  /// Calculate horizontal padding
  double _calculateHorizontalPadding() {
    if (width <= 150) {
      return width * 0.10;
    } else if (width <= 200) {
      return width * 0.11;
    } else if (width <= 250) {
      return width * 0.12;
    } else if (width <= 300) {
      return width * 0.12;
    } else {
      return width * 0.13;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double spacing = _calculateSpacing();
    final double horizontalPadding = _calculateHorizontalPadding();
    final double verticalPadding = width * 0.02;
    final double availableWidth = width - (2 * horizontalPadding);
    final double totalSpacing = spacing * 3;
    final double remainingWidth = availableWidth - totalSpacing;

    final double cityWidth = remainingWidth * 0.18;
    final double twoNumberWidth = remainingWidth * 0.30;
    final double alphabetWidth = remainingWidth * 0.32;
    final double threeNumberWidth = remainingWidth * 0.40;

    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          _plateImage(context),
          package: 'car_license_plate',
          width: width,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: cityWidth,
                child: _PlateSection(
                  text: cityNumber,
                  textSize: effectiveTextSize,
                  maxLength: 2,
                  isInputType: isInputType,
                  onChanged: onCityNumberChanged,
                  usePersianNumbers: usePersianNumbers,
                ),
              ),
              SizedBox(width: spacing),
              SizedBox(
                width: twoNumberWidth,
                child: _PlateSection(
                  text: twoNumber,
                  textSize: effectiveTextSize,
                  maxLength: 3,
                  isInputType: isInputType,
                  onChanged: onTwoNumberChanged,
                  usePersianNumbers: usePersianNumbers,
                ),
              ),
              SizedBox(width: spacing),
              SizedBox(
                width: alphabetWidth,
                child: _AlphabetSection(
                  text: alphabet,
                  size: alphabetWidth,
                  textSize: effectiveTextSize,
                  isInputType: isInputType,
                  onTap: onAlphabetTap,
                ),
              ),
              SizedBox(width: spacing),
              SizedBox(
                width: threeNumberWidth,
                child: _PlateSection(
                  text: threeNumber,
                  textSize: effectiveTextSize,
                  maxLength: 3,
                  isInputType: isInputType,
                  onChanged: onThreeNumberChanged,
                  usePersianNumbers: usePersianNumbers,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlateSection extends StatelessWidget {
  final String text;
  final double textSize;
  final int maxLength;
  final bool isInputType;
  final ValueChanged<String>? onChanged;
  final bool usePersianNumbers;

  const _PlateSection({
    required this.text,
    required this.textSize,
    required this.maxLength,
    required this.isInputType,
    this.onChanged,
    required this.usePersianNumbers,
  });

  String _formatNumber(String numberString) {
    final int? number = int.tryParse(numberString);
    if (number == null) return numberString;

    if (usePersianNumbers) {
      final formatter = intl.NumberFormat('#', 'fa_IR');
      return formatter.format(number);
    } else {
      final formatter = intl.NumberFormat('#', 'en_US');
      return formatter.format(number);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isInputType) {
      return TextField(
        controller: TextEditingController(text: text)
          ..selection = TextSelection.collapsed(offset: text.length),
        maxLength: maxLength,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: FontWeight.w500,
        ),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          isDense: true,
        ),
        onChanged: onChanged,
      );
    }

    return Center(
      child: Text(
        _formatNumber(text),
        style: TextStyle(
          fontSize: textSize,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _AlphabetSection extends StatelessWidget {
  final String text;
  final double size;
  final double textSize;
  final bool isInputType;
  final VoidCallback? onTap;

  const _AlphabetSection({
    required this.text,
    required this.size,
    required this.textSize,
    required this.isInputType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = text == 'معلولین';
    final double radius = size * 0.2;

    Widget content = isDisabled
        ? Image.asset(
      'assets/images/disabled.png',
      package: 'car_license_plate',
      height: size * 0.6,
      color: Theme.of(context).iconTheme.color,
    )
        : Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );

    if (isInputType && onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          width: size,
          height: size,
          child: Center(child: content),
        ),
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: Center(child: content),
    );
  }
}