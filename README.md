# UserDefaultsKey

A package to create and use typed keys for `UserDefaults` and `@AppStorage`.

## Example

### Declare a key
```swift
extension UserDefaults.Key where Value == Int {
  static let myIntValue = Self("myIntValue")
}

extension UserDefaults.DefaultValueKey where Value == Int {
  static let myIntValueWithDefault = Self("myIntValueWithDefault", defaultValue: 42)
}
```
### Usage

```swift
// Get Value
let myIntValue = UserDefaults.standard.integer(for: .myIntValue)

// Set Value
UserDefaults.standard.set(1234, for: .myIntValue)
```

```swift
struct MyView: View {
  @AppStorage(.myIntValue) var myIntValue = 1
  @AppStorage(.myIntValueWithDefault) var myIntValueWithDefault

  var body: some View {
    // ...
  }
}
```

## Warning

Make sure you don't create a `static let` with the same variable name on both `UserDefaults.Key` and `UserDefaults.DefaultValueKey`.
This won't compile if you use this key with `UserDefaults`. If you only use it with `@AppStorage` the result may be surprising.

## Notes

Please create an Issue in case a function is missing.
