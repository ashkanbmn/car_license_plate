# car_license_plate

# A Flutter Package To Use Vehicle License Plate of Iran .

## Getting Started

This project is a starting point for a Flutter plug-in package, a specialized package that includes platform-specific implementation code for All Platforms.

# License plate's input mode
![Screenshot_20231007_124838](https://github.com/ashkanbmn/car_license_plate/assets/74037732/b0b20222-456d-4443-abf2-fd567cfcbcd3)


# License plate's show mode
![Screenshot_20231007_134442](https://github.com/ashkanbmn/car_license_plate/assets/74037732/cbe9d87d-7a24-4a7a-ae23-89671d03b3dc)


## Usage

```dart
// To use the license plate's show mode:
const CarLicensePlate(
isInputType: false,
noneInputAlphabetSection: "الف",
noneInputCityNumber: "63",
noneInputThreeNumberSection: "369",
noneInputTwoNumberSection: "21",
),

// To use the license plate's input mode:
CarLicensePlate(
isInputType: true,
inputCityNumberTextFormField: TextFormField(),
inputTwoNumberSectionTextFormField: TextFormField(),
inputThreeNumberSectionTextFormField: TextFormField(),
pickedPersianWord: pickedWordValue,
modalBottomSheet: showBottomSheet
)

// To use the TextFormFields : 
TextFormField(
controller:TwoNumberSectionController,
focusNode: TwoNumberSectionFocus,
textDirection: TextDirection.ltr,
textAlign: TextAlign.center,
style: TextStyle(
// It is important that the fontSize be 36.
fontSize: 36,
color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
),
keyboardType: TextInputType.number,
decoration: InputDecoration(
// hint text can be two or three ("-- or ---") based on car license plate's Section
hintText: "- -",
hintStyle: TextStyle(fontSize: 30, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
// It is important that border be InputBorder.none;
border: InputBorder.none,
),
)

// To use the persian words :
List<String> persianWords = ['الف', 'ب', 'پ', 'ت', 'ث', 'ج', 'چ', 'ح', 'خ', 'د', 'ذ', 'ر', 'ز', 'ژ', 'س', 'ش', 'ص', 'ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق', 'ک', 'گ', 'ل', 'م', 'ن', 'و', 'ه', 'ی', 'معلولین'];

// To use the bottom model sheet : 
// Define a dynamic string that initially equals 'الف,' but changes based on the tap value.
String pickedWordValue = "الف";
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
children: persianWords.map<Widget>((String value) {
return InkWell(
onTap: () {
setState(() {
pickedWordValue = value;
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
```
