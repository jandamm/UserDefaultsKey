public extension UserDefaults {
	func object<Object: RawRepresentable>(for key: Key<Object>) -> Object? {
		guard let raw = object(forKey: key.rawKey) as? Object.RawValue else { return nil }
		return Object(rawValue: raw)
	}

	func object<Object: RawRepresentable>(for key: DefaultValueKey<Object>) -> Object {
		object(for: key.key) ?? key.defaultValue
	}

	func rawValue<Object: RawRepresentable>(for key: Key<Object>) -> Object.RawValue? {
		object(forKey: key.rawKey) as? Object.RawValue
	}

	func rawValue<Object: RawRepresentable>(for key: DefaultValueKey<Object>) -> Object.RawValue {
		rawValue(for: key.key) ?? key.defaultValue.rawValue
	}

	func set<Value: RawRepresentable>(_ value: Value, for key: Key<Value>) {
		set(value.rawValue, forKey: key.rawKey)
	}

	func set<Value: RawRepresentable>(_ value: Value, for key: DefaultValueKey<Value>) {
		set(value, for: key.key)
	}
}
