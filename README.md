# car_license_plate

A flutter package to use vehicle license plate of Iran .

## Getting Started

This project is a starting point for a Flutter plug-in package, a specialized package that includes platform-specific implementation code for All Platforms.

# License plate's input mode
![Screenshot_20231007_124838](https://github.com/ashkanbmn/car_license_plate/assets/74037732/b0b20222-456d-4443-abf2-fd567cfcbcd3)


# License plate's show mode
![Screenshot_20231007_134442](https://github.com/ashkanbmn/car_license_plate/assets/74037732/cbe9d87d-7a24-4a7a-ae23-89671d03b3dc)


## Usage

```dart
// To use the license plate's show mode:
 CarLicensePlate(
  isInputType: false,
  noneInputAlphabetSection: "الف",
  noneInputCityNumber: "63",
  noneInputThreeNumberSection: "369",
  noneInputTwoNumberSection: "21",
),

// To use the license plate's input mode:
  CarLicensePlate(
   isInputType: true,
  ),
```
