import UserDefaultsKey

extension UserDefaults.DefaultValueKey where Value == Int {
	static let intValue = Self("intValue", default: 42)
}

extension UserDefaults.DefaultValueKey where Value == Float {
	static let floatValue = Self("floatValue", default: 1337)
}

extension UserDefaults.DefaultValueKey where Value == Int? {
	static let optionalValue = Self("optionalValue", default: 42)
}

extension UserDefaults.Key where Value == Int {
	static let int: Self = "int"
}

extension UserDefaults.Key where Value == Float {
	static let float = Self("float")
}

extension UserDefaults.Key where Value == Int? {
	static let optional = Self("optional")
}

enum SomeValue: String {
	case first, second, third
}

extension UserDefaults.DefaultValueKey where Value == SomeValue {
	static let someValue = Self("someValue", default: .second)
}
