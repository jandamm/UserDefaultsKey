@_exported import Foundation

public extension UserDefaults {
	func removeObject<Value>(for key: Key<Value>) {
		removeObject(forKey: key.key)
	}

	func removeObject<Value>(for key: DefaultValueKey<Value>) {
		removeObject(forKey: key.key)
	}

	func value<Value>(for key: Key<Value>) -> Value? {
		value(forKey: key.key) as? Value
	}

	func value<Value>(for key: DefaultValueKey<Value>) -> Value {
		value(forKey: key.key) as? Value ?? key.defaultValue()
	}

	func setValue<Value>(_ value: Value, for key: Key<Value>) {
		setValue(value, forKey: key.key)
	}

	func setValue<Value>(_ value: Value, for key: DefaultValueKey<Value>) {
		setValue(value, forKey: key.key)
	}

	func setNilValueForKey<Value>(_ key: Key<Value>) {
		setNilValueForKey(key.key)
	}

	func setNilValueForKey<Value>(_ key: DefaultValueKey<Value>) {
		setNilValueForKey(key.key)
	}

	/**
	 -setObject:forKey: immediately stores a value (or removes the value if nil is passed as the value) for the provided key in the search list entry for the receiver's suite name in the current user and any host, then asynchronously stores the value persistently, where it is made available to other processes.
	 */
	func set<Value>(_ value: Value, for key: Key<Value>) {
		set(value, forKey: key.key)
	}

	/**
	 -setObject:forKey: immediately stores a value (or removes the value if nil is passed as the value) for the provided key in the search list entry for the receiver's suite name in the current user and any host, then asynchronously stores the value persistently, where it is made available to other processes.
	 */
	func set<Value>(_ value: Value, for key: DefaultValueKey<Value>) {
		set(value, forKey: key.key)
	}
}
