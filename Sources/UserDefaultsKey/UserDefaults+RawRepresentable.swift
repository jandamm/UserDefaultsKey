public extension UserDefaults {
	func object<Object: RawRepresentable>(for key: Key<Object>) -> Object? {
		guard let raw = object(forKey: key.key) as? Object.RawValue else { return nil }
		return Object(rawValue: raw)
	}

	func object<Object: RawRepresentable>(for key: DefaultValueKey<Object>) -> Object {
		guard let raw = object(forKey: key.key) as? Object.RawValue else { return key.defaultValue() }
		return Object(rawValue: raw) ?? key.defaultValue()
	}

	func rawValue<Object: RawRepresentable>(for key: Key<Object>) -> Object.RawValue? {
		object(forKey: key.key) as? Object.RawValue
	}

	func rawValue<Object: RawRepresentable>(for key: DefaultValueKey<Object>) -> Object.RawValue {
		object(forKey: key.key) as? Object.RawValue ?? key.defaultValue().rawValue
	}

	func set<Value: RawRepresentable>(_ value: Value, for key: Key<Value>) {
		set(value.rawValue, forKey: key.key)
	}

	func set<Value: RawRepresentable>(_ value: Value, for key: DefaultValueKey<Value>) {
		set(value.rawValue, forKey: key.key)
	}
}
