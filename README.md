# UserDefaultsKey

A package to create and use typed keys for `UserDefaults` and `@AppStorage`.

## Why?

`@AppStorage` is a newer API and it works nicer than `UserDefaults` but it's still not perfect also the interop leaves room for desires.

- Keys are strings, so there is no code completion
- Keys could represent any `Type` this type has to be remembered when retrieving the value
- There is no nice way to set default values\*
- Even if there is a default value an optional is returned
- Storing `RawRepresentable` in `UserDefaults` is cumbersome (actually store `rawValue`)
- Retrieving `RawRepresentable` from `UserDefaults` is even more cumbersome

\* With `UserDefaults` `register(defaults:)` has to be called. Which accepts a `String` keyed `Dictionary` which is prone to errors.
Also if there is a central place for all used keys, the default values are probably stored elsewhere.
With `@AppStorage` the default values can directly be set in the `View` while this is nice you might end up with many places where the default value has to be set. This can easily lead to inconsistencies.

## Solution

Declare all used keys in one place and provide a default value where needed.
The library takes care of converting `RawRepresentable` as expected.

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
