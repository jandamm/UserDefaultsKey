@_exported import Foundation

public extension UserDefaults {
	func removeObject<Value>(for key: Key<Value>) {
		removeObject(forKey: key.rawKey)
	}

	func removeObject<Value>(for key: DefaultValueKey<Value>) {
		removeObject(forKey: key.key)
	}

	func any<Value>(for key: Key<Value>) -> Any? {
		object(forKey: key.rawKey)
	}

	func any<Value>(for key: DefaultValueKey<Value>) -> Any {
		object(forKey: key.key) ?? key.defaultValue
	}

	/**
	 -setObject:forKey: immediately stores a value (or removes the value if nil is passed as the value) for the provided key in the search list entry for the receiver's suite name in the current user and any host, then asynchronously stores the value persistently, where it is made available to other processes.
	 */
	func set<Value>(_ value: Value, for key: Key<Value>) {
		set(value, forKey: key.rawKey)
	}

	/**
	 -setObject:forKey: immediately stores a value (or removes the value if nil is passed as the value) for the provided key in the search list entry for the receiver's suite name in the current user and any host, then asynchronously stores the value persistently, where it is made available to other processes.
	 */
	func set<Value>(_ value: Value, for key: DefaultValueKey<Value>) {
		set(value, forKey: key.key)
	}
}
