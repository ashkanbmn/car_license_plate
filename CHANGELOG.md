## Changelog

### [0.0.7] - 2025-12-23
#### ✨ New Features
- **Persian/English Numbers**: Added `usePersianNumbers` parameter to toggle between ۰-۹ and 0-9
- **Custom Width**: Added `width` parameter for responsive sizing (150px-360px)
- **Dynamic Scaling**: All elements now scale proportionally with width

#### 🔧 Breaking Changes
- Replaced `TextFormField` parameters with `String` values and callbacks
- New API:
  ```dart
  CarLicensePlate(
    cityNumber: '12',
    onCityNumberChanged: (val) => setState(() => cityNum = val),
    usePersianNumbers: true,  // NEW
    width: 250,                // NEW
  )